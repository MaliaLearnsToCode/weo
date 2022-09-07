class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :reiviews, dependent: :destroy
  has_one :itinerary, through: :activity
end
