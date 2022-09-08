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
    # @itinerary = Itinerary.new

    if params[:start_date].present? && params[:end_date].present? && params[:location].present?

      start_date = DateTime.parse(params[:start_date])
      end_date = DateTime.parse(params[:end_date])
      location = params[:location]

      @start_date = start_date
      @end_date = end_date
      @location = location

      geocoded_location = Geocoder.search(location).first

      @itineraries = policy_scope(Itinerary.near(geocoded_location.coordinates, "30").where("itineraries.start_date <= ? AND itineraries.end_date >= ?", start_date, end_date))


      # @itinerary_activities = Itinerary.joins(:activities).where("itineraries.start_date <= ? AND itineraries.end_date >= ?", start_date, end_date).near(geocoded_location.coordinates, "5")

      # .map { |activity| activity.itinerary }

      # JOIN @itineraries and @itinerary_activities !!! OR add start_date and end_date to @itineraries_activities !!!!! DO DO DO DO

    else
      @itineraries = Itinerary.all
      @itineraries = policy_scope(Itinerary)
    end

  end


  def new
    @itinerary = Itinerary.new
    authorize @itinerary
    @user = current_user

    @itineraries = Itinerary.all
    markers_arr = @itineraries.geocoded.map do |itinerary|
      {
        lat: itinerary.latitude,
        lng: itinerary.longitude
      }
    end
    @markers = []
    @markers << markers_arr.first
  end

  def create
    # if the person wants to save an empty itinerary, then itinerary is saved to itineraries index
    # else if the person wants to add an activitiy, the person will be redirect to the activities/new path
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user
    @itinerary.start_date = params[:start_date].to_date
    @itinerary.end_date = params[:end_date].to_date

    authorize @itinerary

    if @itinerary.save
      if params[:commit] == 'Save itinerary'
        redirect_to itineraries_path
      else
        redirect_to new_itinerary_activity_path(@itinerary)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    authorize @itinerary
    @participation = Participation.new
    # @participation = Participation.find(params[:id])
  end

  def destroy
  end

  def my_itineraries
    @itineraries = current_user.itineraries
    @participated_itineraries = []
    @participations = Participation.where(user: current_user).where(status: "confirmed")

    # Itinerary.all.each do |itinerary|

    #   @participated_itineraries << current_user.participations
    #   .activity.itinerary if current_user.participation.status == "confirmed"
    # end

    @participations.each do |participation|
      @participated_itineraries << participation.itinerary
    end

    @all_itineraries = []
    @all_itineraries = @participated_itineraries + @itineraries

    # @all_itineraries = []
    # @itineraries.each do |itinerary|
    #   @all_itineraries << itinerary if participation.status == "confirmed"
    # end


    @upcoming_itineraries = []
    @all_itineraries.each do |itinerary|
      @upcoming_itineraries << itinerary if itinerary.start_date > Date.today
    end

    @past_itineraries = []
    @all_itineraries.each do |itinerary|
      @past_itineraries << itinerary if itinerary.end_date < Date.today
    end

    @current_itineraries = []
    @all_itineraries.each do |itinerary|
      if itinerary.start_date < Date.today && itinerary.end_date > Date.today
        @current_itineraries << itinerary
      end
    end
    # raise
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
    params.require(:itinerary).permit(:title, :description, :country, :city, :start_date, :end_date, :user_id, :location, photos: [])
  end


  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_login_url # halts request cycle
  #   end
  # end

end
