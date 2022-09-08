class ReviewsController < ApplicationController
  before_action :set_participation, except: %i[new]
  before_action :set_user, except: %i[new]
  before_action :set_author, except: %i[new]
  before_action :set_review, only: %i[show], except: %i[new]


  def index
    @reviews = policy_scope(Review)
    @reviews = Review.where(user: current_user)
  end

  def new
    @review = Review.new
    authorize @review
    @activity = Activity.find(params[:activity_id])
    @participation = Participation.where(user: current_user).where(activity: @activity).first
  end

  def create
    # debugger
    @review = Review.new(review_params)
    @review.participation = @participation
    @review.author = @author
    @review.user = @user
    @review.participation = @participation
    authorize @review

    if @review.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @review
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_participation
    @participation = Participation.find(params[:participation_id])
  end

  def set_user
    if @participation.activity.itinerary.user == current_user
      @user = @participation.user
    else
      @user = @participation.activity.itinerary.user
    end
  end

  def set_author
    @author = current_user
  end

end
