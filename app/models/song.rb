class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  
  validates :title, presence: true
  validates :album_name, presence: true
end 