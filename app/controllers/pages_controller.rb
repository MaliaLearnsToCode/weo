class PagesController < ApplicationController
  # Check if user is signed in
  # If user IS signed in then skip this page and route to itineraries index
  # If user is NOT signed in, then show this page
  skip_before_action :authenticate_user!, only: [:home]
  def check_sign

  end

  if user_signed_in?
    puts
  else
    puts "user is not"
  end
  # link_to /itineraries

  def home
  end
end
