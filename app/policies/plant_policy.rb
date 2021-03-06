class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    record.user == user
  end

  def create?
    record.user == user
  end
end
