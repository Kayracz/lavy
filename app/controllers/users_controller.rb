class UsersController < ApplicationController
  def show
    authorize @user
    @user = current_user
    @orders = current_user.orders
  end
end
