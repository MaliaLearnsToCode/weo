class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: %i[show]

  def show
    @user = User.find(params[:id])
  end
end
