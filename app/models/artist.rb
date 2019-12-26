class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  has_many :users, through: :songs
  
  #belongs_to :genre
  
  accepts_nested_attributes_for :songs
  
  def self.alphabetical_order
    order(:name)
  end

end