class UsersController < ApplicationController
  def show
    @user = current_user #
    authorize @user      # We need to authorise @user to send it to the view
  end
end
