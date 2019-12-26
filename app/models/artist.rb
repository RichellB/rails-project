class Artist < ActiveRecord::Base
  has_many :songs
  #has_many :genres, through: :songs
  has_many :users, through: :songs
  has_secure_password 
  
  belongs_to :genre
  accepts_nested_attributes_for :genres
  
  validates :email_address, uniqueness: true
  validates_presence_of :username

end