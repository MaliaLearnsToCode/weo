class Itinerary < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
