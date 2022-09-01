class UsersController < ApplicationController
  def show
    @user = User.includes(:activities).find(params[:id])
  end
end
