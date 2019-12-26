class Song < ActiveRecord::Base
  belongs_to :artist
  #belongs_to :genre
  belongs_to :user
  
  validates :title, presence: true

  accepts_nested_attributes_for :artist

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end
  
end