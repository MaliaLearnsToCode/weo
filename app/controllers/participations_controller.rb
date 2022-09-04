class ParticipationsController < ApplicationController
  def index
    @participations = policy_scope(Participation)
  end

  def new
  end

  def create
  end

  def approve
    @participation = Participation.find(params[:id])
    @participation.approve(status: "approved")
    if @participation.status == "approved"
      flash[:success] = "Done"
    else
      flash[:error] = "Not approved"
    end
  end

  def show
  end

  def update
  end

  def destroy
  end
end
