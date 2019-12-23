class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  has_secure_password 
  
  validates_presence_of :name  #, :email_address, :username
  #validates :username, uniqueness: true 
  #validates :email_address, uniqueness: true 
 # validates :password, length: { in: 8..16 }

end