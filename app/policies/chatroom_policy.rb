class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      scope.where(user: user)
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
      true
    end

  end

end
