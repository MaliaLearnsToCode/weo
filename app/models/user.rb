class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages, dependent: :destroy
  has_many :itineraries, dependent: :destroy
  has_many :activities, through: :itineraries, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
