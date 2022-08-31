class Activity < ApplicationRecord
  belongs_to :itinerary
  belongs_to :interest_type

  has_many :chatrooms, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :detail, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_participants, presence: true
end
