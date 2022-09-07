class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :reviews, dependent: :destroy
  has_one :itinerary, through: :activity


end
