class ReviewsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @review = @order.reviews.build
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.order = Order.find(params[:order_id])
    authorize @review
    if @review.save
      redirect_to dashboard_path
    else
      render :mew
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to dashboard_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :stars)
  end
end
