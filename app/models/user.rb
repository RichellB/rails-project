class User < ApplicationRecord  #ActiveRecird__Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :name, :email, :image, :uid
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :songs
  has_many :artists, through: :songs

  validates :email_address, uniqueness: true
  validates :email_address, presence: true
end
