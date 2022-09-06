class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show destroy]
  # before_action :set_activity, only: %i[show]

  def index
  end

  def new
  end

  def create
  end

  def show
    authorize @chatroom
    @message = Message.new
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
end
