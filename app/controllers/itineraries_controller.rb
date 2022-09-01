require 'date'
class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  #before_action :require_login

  def index
    # @itineraries = Itinerary.all.includes(:activities)
    @itineraries = Itinerary.all
    @itineraries = policy_scope(Itineraries)
    # @itinerary = Itinerary.find(params[:id])
    # @activities = @itinerary.activities

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
  end

  def destroy
  end

  def my_itineraries
    # raise
    itineraries = current_user.itineraries

    @upcoming_itineraries = []
    itineraries.each do |itinerary|
      @upcoming_itineraries << itinerary if itinerary.start_date > Date.today
    end

    @past_itineraries = []
    itineraries.each do |itinerary|
      @past_itineraries << itinerary if itinerary.end_date < Date.today
    end

    @current_itineraries = []
    itineraries.each do |itinerary|
      if itinerary.start_date > Date.today && itinerary.end_date < Date.today
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
    params.require(:itinerary).permit(:title, :description, :country, :city, :start_date, :end_date, :user_id, photo: [])
  end

  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_login_url # halts request cycle
  #   end
  # end

end
