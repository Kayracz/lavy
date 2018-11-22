class LaundromatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.near(laundromat_params[:address], 10)
    end
  end

  def show?
    true
  end
end
