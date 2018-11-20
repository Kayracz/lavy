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

private

def orders_params
  authorize @order
end
end
