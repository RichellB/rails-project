class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs
  
  validates :genre_name, presence: true
end
