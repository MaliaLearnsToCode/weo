class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    # user_is_chatroom_participant?
    # user_is_chatroom_creator?
    record.activity.participations.where(user: user).present? || record.activity.itinerary.user == user
  end

  private

  def user_is_chatroom_participant?
    @activity.participations.user.where(id: user.id).present?
  end

  def user_is_chatroom_creator?
    @activity.itinerary.user.where(id: user.id).present?
  end

end
