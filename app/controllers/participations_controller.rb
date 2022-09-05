class ParticipationsController < ApplicationController
  skip_after_action :verify_authorized, only: %i[approve]

  def index
    @participations = policy_scope(Participation)
  end

  def new
  end

  def create
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
  end
end
