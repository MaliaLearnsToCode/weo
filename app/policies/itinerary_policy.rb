class ItineraryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # If users can see all itineraries
      # scope.where(user: user) # If users can only see their itineraries
      # scope.where("name LIKE 't%'") # If users can only see itineraries starting with `t`
      # ...
    end
  end
end
