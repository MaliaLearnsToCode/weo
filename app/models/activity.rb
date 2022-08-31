class Activity < ApplicationRecord
  belongs_to :itinerary
  belongs_to :interest_type

  has_many :chatrooms
  has_many :reviews
  has_many :participants

  validates :name, presence: true
  validates :detail, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :completed, presence: true
  validates :max_participants, presence: true
end
