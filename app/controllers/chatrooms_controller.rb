class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show destroy]
  before_action :authenticate_user!

  # before_action :set_activity, only: %i[ show create]

  def index
    @itineraries = current_user.itineraries

    @itineraries.each do |itinerary|
      itinerary.activities.each do |activity|
        Chatroom.create!(activity: activity, name: activity.name) if activity.chatroom.nil?
      end
    end

    @chatrooms = policy_scope(Chatroom)
    # @chatrooms = policy_scope(Chatroom).where(id: current_user.chatroom_ids).order(created_at: :desc)

    @user_chatrooms = []

    current_user.activities.each do |activity|
      @user_chatrooms << activity.chatroom unless activity.chatroom.nil?
    end

    @message = Message.new
  end


  def new
  end


  def create
    @chatroom = @chatroom.activity
    @participant = User.find(params[:participant.user_id])
    @creator = User.find(params[:creator.user_id])
    @chatroom = authorize Chatroom.new
    # for each chatroom, the number of chatters in the chatrooms should not exceed the number of participants + creator from the activity
    # save
    @chatroom.users << @participant
    @chatroom.users << @creator
    if chatroom.save
      redirect_to chatrooms_path(chatroom: chatroom.id)
    else
      redirect_to chatrooms_path(chatroom: @chatroom.id)
    end
  end


  def show
    authorize @chatroom
    @message = Message.new
    @user_chatbox = []
    current_user.messages.each do |message|
      @user_chatbox << message
    end

    # @chatroom.activity.participations.where(user: current_user).present? || @chatroom.activity.itinerary.user == current_user
  end


  def destroy
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  # def set_activity
  #   @activity = Activity.find(params[:activity_id])
  # end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
