class UserPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end
  end

  def show?
    # record == user
    true
  end
end
