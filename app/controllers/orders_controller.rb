class OrdersController < ApplicationController
  def new
    @laundromat = Laundromat.find(params[:laundromat_id])
    @order = Order.new
    authorize @order
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
   @order = Order.new(order_params)
   @laundromat = Laundromat.find(params[:laundromat_id])
   @order.laundromat = @laundromat
   @order.user = current_user
   if @order.save
    authorize @order
    redirect_to laundromat_order_path(@laundromat, @order)
  else
    render :new
  end
end

def edit
 authorize @order
end

def update
 authorize @order
end

def destroy
  @order = Order.find(params[:id])
  authorize @order
  @order.reviews.destroy_all  # We need to destroy all the children before we destroy the parent
  @order.destroy              # Otherwise, we'll have references in the children to a parent id which doesn't exist
  redirect_to dashboard_path
end

private

def orders_params
  authorize @order
end
end
