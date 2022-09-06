class ParticipationsController < ApplicationController
  skip_after_action :verify_authorized, only: %i[approve]

  def index
    @confirmed_activities = policy_scope(current_user.activity_where("confirmed"))
    @participations_pending = policy_scope(current_user.activity_where("pending"))
  end

  def new
  end

  def create
    @participation = Participation.new
    @participation.user = current_user
    @participation.activity = Activity.find(params[:participation][:activity])

    authorize @participation

    if @participation.save
      redirect_to itinerary_path(@participation.activity.itinerary)
    else
    end
  end

  def approve
    @activities = current_user.activities.joins(:participations).distinct.where("participations.status = 'pending'")
    # @participations = policy_scope(Participation)

    # @participations = policy_scope(Participation)
    # @participation = Participation.find(params[:id])
    # @participation.approve(status: "approved")
    # if @participation.status == "approved"
    #   flash[:success] = "Done"
    # else
    #   flash[:error] = "Not approved"
    # end

  end

  def show
  end

  def update
  end

  def destroy
    @participation = Participation.find(params[:id])
    authorize @participation
    @participation.destroy
    redirect_to itinerary_path(@participation.activity.itinerary), status: :see_other
  end
end
