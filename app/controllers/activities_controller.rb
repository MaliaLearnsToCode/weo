class ActivitiesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :show ]

  def index
  end

  def new
  end

  def create
  end

  def show
<<<<<<< HEAD
    @activity = Activity.find(params[:id])
=======
    # @activity = Activity.find(params[:id])
    # authorize @activity
>>>>>>> master
  end

  def edit
  end

  def update
  end

  def pending
  end
end
