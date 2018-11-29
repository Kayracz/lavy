class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
    record.user == user
  end

  def create?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def update_picked?
    record.pick_up_guy == user
  end

  def update_delivered?
    record.delivery_guy == user
  end

  def update_removed?
    true
  end

  def destroy?
    true
  end

  def map_pick_up?
    true
  end

  def map_delivery?
    true
  end
end
