class PagesController < ApplicationController
  # Check if user is signed in
  # If user IS signed in then skip this page and route to itineraries index
  # If user is NOT signed in, then show this page
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to itineraries_path if user_signed_in?
  end
end
