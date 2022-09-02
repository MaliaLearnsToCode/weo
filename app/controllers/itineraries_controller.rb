require 'date'
class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  skip_after_action :verify_authorized, only: %i[my_itineraries]
  #before_action :require_login

  def index

    # @itineraries = Itinerary.all
    # # The `geocoded` scope filters only flats with coordinates
    # @markers = @itineraries.geocoded.map do |itinerary|
    #   {
    #     lat: flat.latitude,
    #     lng: flat.longitude
    #   }
    # end

    @start_date = ""
    @end_date = ""
    @location = ""
    @itinerary = Itinerary.new

    if params[:start_date].present? && params[:end_date].present? && params[:location].present?

      start_date = DateTime.parse(params[:start_date])
      end_date = DateTime.parse(params[:end_date])
      location = params[:location]

      @start_date = start_date
      @end_date = end_date
      @location = location

      geocoded_location = Geocoder.search(location).first


      @itineraries = policy_scope(Itinerary.near(geocoded_location.coordinates, "5").where("itineraries.start_date <= ? AND itineraries.end_date >= ?", start_date, end_date))

      @itinerary_activities =  Activity.near(geocoded_location.coordinates, "5").map { |activity| activity.itinerary }

      # JOIN @itineraries and @itinerary_activities !!! OR add start_date and end_date to @itineraries_activities !!!!! DO DO DO DO

    else
      @itineraries = Itinerary.all
      @itineraries = policy_scope(Itinerary)
    end

  end


  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    authorize @itinerary
  end

  def destroy
  end

  def my_itineraries
    #
    # raise
    @itineraries = current_user.itineraries

    @upcoming_itineraries = []
    @itineraries.each do |itinerary|
      @upcoming_itineraries << itinerary if itinerary.start_date > Date.today
    end

    @past_itineraries = []
    @itineraries.each do |itinerary|
      @past_itineraries << itinerary if itinerary.end_date < Date.today
    end

    @current_itineraries = []
    @itineraries.each do |itinerary|
      if itinerary.start_date < Date.today && itinerary.end_date > Date.today
        @current_itineraries << itinerary
      end
    end

    # if @itinerary.start_date > Date.now && Date.now < @itinerary.end_date
    #   ongoing_itinerary
    # else
    #   if @itinerary.end_date > Date.now
    #   past_itinerary
    #   else
    #   @itinerary.end_date >
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:title, :description, :country, :city, :start_date, :end_date, :user_id, :location, photo: [])
  end

  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_login_url # halts request cycle
  #   end
  # end

end
