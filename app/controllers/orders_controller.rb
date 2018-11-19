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

private

def orders_params
end
end
