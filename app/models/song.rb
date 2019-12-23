class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  
  validates :title, presence: true
  #validates :artist_name, presence: true
  

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end
end