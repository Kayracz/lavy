class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review).all #you could do it in the descending order way or all
  end

  def show
    authorize @review
  end
end
