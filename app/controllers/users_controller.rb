class UsersController < ApplicationController
  def show
    @user = User.find_by_first_name(params[:id])
  end
end
