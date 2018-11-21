class UsersController < ApplicationController
  def show
    @user = current_user
    authorize @user
    @orders = current_user.orders
  end
end
