class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    # @itineraries = Itinerary.all.includes(:activities)
    @itineraries = Itinerary.all
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
  end
end
