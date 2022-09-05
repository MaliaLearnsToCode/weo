class ParticipationsController < ApplicationController
  def index
    @participations = policy_scope(Participation.where(user: current_user))
  end

  def new
  end

  def create
  end

  def show
  end

  def approve
  end

  def destroy
  end
end
