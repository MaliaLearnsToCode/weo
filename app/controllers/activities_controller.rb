class ActivitiesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :show ]

  def index
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
  end

  def new
  end

  def create
  end

  def show
    # @activity = Activity.find(params[:id])
    # authorize @activity
  end

  def edit
  end

  def update
  end

  def pending
  end
end
