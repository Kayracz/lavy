class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    user_is_owner?
  end

  def show?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def create?
    record.order.user == user
  end

  private

  def user_is_owner?
    record.user == user
  end
end
