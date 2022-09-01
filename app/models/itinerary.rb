class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :overlapping, (lambda do |start_date, end_date|
    Itinerary.where("start_date < ? AND end_date > ?",
    start_date, end_date)
  end)

end
