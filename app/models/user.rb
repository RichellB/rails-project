class User < ApplicationRecord  #ActiveRecird__Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :songs
  has_many :artists, through: :songs

  validates :email, uniqueness: true
  validates :email, presence: true
end
