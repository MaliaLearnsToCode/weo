class PagesController < ApplicationController
  # layout "pages"
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end
end
