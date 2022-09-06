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

    # @activities = current_user.activities.joins(:participations).distinct.where("participations.status = 'pending'")
    # @activities = current_user.activity_where("pending")
    # raise

    @activities = current_user.activity_creator("pending")
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
    @participation = Participation.find(params[:id])
    participation_params[:mode] == "accept" ? @participation.status = "confirmed" : @participation.status = "cancelled"
    authorize @participation
    @participation.save!
    redirect_to approve_participations_path
  end

  def destroy
    @participation = Participation.find(params[:id])

    authorize @participation
    @participation.destroy
    redirect_to itinerary_path(@participation.activity.itinerary), status: :see_other

  end

  def destroyApproved
    @participation = Participation.find(params[:id])
    authorize @participation
    @participation.destroy
    redirect_to approve_participations_path, status: :see_other
  end

  private

  def participation_params
    params.require(:participation).permit(:mode)
  end
end
