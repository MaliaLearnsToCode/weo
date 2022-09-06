class ParticipationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.where(user: user)
    end
  end


  def approve?
    true
  end

  def destroy?
    true
  end

  def update?
    true
  end

  def destroyApproved?
    true
  end
end
