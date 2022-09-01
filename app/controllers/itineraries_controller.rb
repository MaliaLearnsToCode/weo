class ItinerariesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index

    @start_date = ""
    @end_date = ""

    if params[:start_date].present? && params[:end_date].present?
      start_date = DateTime.parse(params[:start_date])
      end_date = DateTime.parse(params[:end_date])

      @start_date = start_date
      @end_date = end_date

      @itineraries = Itinerary.overlapping(start_date, end_date)
      @itineraries = policy_scope(Itinerary.overlapping(start_date, end_date))

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
    authorize @itinerary
  end

  def destroy
  end

  def my_itineraries
  end
end
