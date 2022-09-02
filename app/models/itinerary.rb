class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  accepts_nested_attributes_for :activities

  geocoded_by :country
  after_validation :geocode, if: :will_save_change_to_country?

  scope :overlapping, (lambda do |start_date, end_date, location|
    Itinerary.joins(:activities).where("itineraries.start_date <= ? AND itineraries.end_date >= ? AND (activities.location ILIKE ? OR itineraries.country ILIKE ? OR itineraries.city ILIKE ?)",
    start_date, end_date, "%#{location}%", "%#{location}%", "%#{location}%")
  # Itinerary.where("start_date <= ? AND end_date >= ?",
  # start_date, end_date)
  end)


  # scope :overlapping, (lambda do |start_date, end_date, location|
  #   Itinerary.joins(:activities).where("itineraries.start_date <= ? AND itineraries.end_date >= ? AND (activities.location ILIKE ?)",
  #   start_date, end_date, "%#{location}%")
  # end)

  # scope :current_itineraries, -> (my_itineraries) do
  #  where(start_date: "start_date >=  Date.now and end_date <= date.now")
  # end

  # scope :current_itineraries, ->(booking_status, current_user) do
  #   where(start_date: booking_status).joins(:itinerary).where('watches.user': current_user)
  # end

  # scope :current_itineraries, -> (start_date, end_date, Date.now, current_user) do
  #   where(start_date: start_date).joins(:watch).where('itineraries.user': current_user)
  # end

  # def current_itineraries
  #   @current_itineraries = Itinerary.find(:all, :conditions => ['start_date =?', Date.now])
  #   @current_itineraries = Itinerary.where("start_date >=  ? and end_date <= ?", start_date, end_date)
  # end

  # def current_itineraries
  #   # @current_itineraries = Itinerary.find(:all, :conditions => ['start_date =?', Date.now])
  #   @current_itineraries = Itinerary.where("start_date >=  ? and end_date <= ?", start_date, end_date)
  # end

end
