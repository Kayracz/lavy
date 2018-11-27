class ReviewsController < ApplicationController
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to dashboard_path
  end
end
