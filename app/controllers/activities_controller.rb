class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show success]
  before_action :set_itinerary, only: %i[show new create]

  def index
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
    @activities = policy_scope(Activity)
  end

  def new
    @activity = Activity.new
    @user = @itinerary.user
    authorize @activity
  end

  def create
    # debugger
    @activity = Activity.new(activity_params)
    @activity.itinerary = @itinerary

    authorize @activity

    respond_to do |format|
      if @activity.save
        format.html { redirect_to itinerary_path(@itinerary) }
      else
        format.html { render "activities/new", status: :unprocessable_entity }
      end
      format.json
    end
  end

  def show
    @markers = [{
      lat: @activity.latitude,
      lng: @activity.longitude,
      info_window: render_to_string(partial: "info_window", locals:{ activity: @activity })
    }]
    authorize @activity
  end

  def edit
  end

  def update
  end

  def pending
  end


  private

  def activity_params
    params.require(:activity).permit(:name, :detail, :location, :max_participants, :completed, :start_date, :end_date, :itinerary_id, :start_time, :end_time, :interest_type_id, photos: [])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

end
