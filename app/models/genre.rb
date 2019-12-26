class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs
  
  accepts_nested_attributes_for :songs
  
  validates :genre_name, presence: true
  
end
