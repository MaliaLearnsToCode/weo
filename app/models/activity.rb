class Activity < ApplicationRecord
  belongs_to :itinerary
  belongs_to :interest_type

  has_one :chatroom, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, class_name: 'User', foreign_key: 'user_id'
  has_one :creator, through: :itineraries, class_name: 'User'

  has_many_attached :photos

  validates :name, presence: true
  validates :detail, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_participants, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


  # scope :status, ->(booking_status, current_user) { Watch.where(user: current_user).joins(:bookings).where('bookings.status': booking_status) }

  def date
    if start_date == end_date
      start_date.strftime('%d %b')
    else
      "#{start_date.strftime('%d %b')} - #{end_date.strftime('%d %b')}"
    end
  end
end
