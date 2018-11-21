class OrdersController < ApplicationController
  def new
    @laundromat = Laundromat.find(params[:laundromat_id])
    @order = Order.new
  end

  def show
   @order = Order.find(params[:id])
 end

 def create
   @order = Order.new(order_params)
   @laundromat = Laundromat.find(params[:laundromat_id])
   @order.laundromat = @laundromat
   @order.user = current_user
   if @order.save
    redirect_to laundromat_order_path(@laundromat, @order)
  else
    render :new
  end
 end

def edit
end

def update
end

def destroy
  @order = Order.find(params[:id])
  @order.reviews.destroy_all  # We need to destroy all the children before we destroy the parent
  @order.destroy              # Otherwise, we'll have references in the children to a parent id which doesn't exist
  redirect_to dashboard_path
end

private

def orders_params
end
end
