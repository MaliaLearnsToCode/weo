class UsersController < ApplicationController

skip_after_action :verify_authorized, only: %i[show]

  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end


  def show
    @user = User.find(params[:id])
  end
end
