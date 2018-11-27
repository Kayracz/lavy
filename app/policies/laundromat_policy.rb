class LaundromatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.order(created_at: :desc)
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def show?
    true
  end
end
