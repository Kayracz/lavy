class ReviewsController < ApplicationController
  before_action :set_order, only: %I[new create]

  def new
    @review = @order.reviews.build
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.order = @order
    authorize @review
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to dashboard_path
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def review_params
    params.require(:review).permit(:description, :stars)
  end
end
