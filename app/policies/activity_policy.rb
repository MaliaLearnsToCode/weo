class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end

    def show?
      true
    end

  end

  def create?
    true
  end
end
