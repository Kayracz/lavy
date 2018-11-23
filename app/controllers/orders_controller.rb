class OrdersController < ApplicationController
  before_action :set_order, except: [:new, :create]

  def show; end

  def new
    @laundromat = Laundromat.find(params[:laundromat_id])
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new(order_params) # Nick comment: need to authorize order before we save it??
    @laundromat = Laundromat.find(params[:laundromat_id])
    @order.laundromat = @laundromat
    @order.user = current_user
    if @order.save
      authorize @order
      redirect_to order_path(@order) # edited by Nick, dont need nesting
    else
      render :new
    end
  end

  def destroy
    @order.reviews.destroy_all  # We need to destroy all the children before we destroy the parent
    @order.destroy              # Otherwise, we'll have references in the children to a parent id which doesn't exist
    redirect_to dashboard_path
  end

  def map_pick_up
    @markers = [{lng: @order.longitude, lat: @order.latitude, infoWindow: { content: render_to_string(partial: "/orders/map_window_client", locals: { order: @order }) }}, {lng: @order.laundromat.longitude, lat: @order.laundromat.latitude, infoWindow: { content: render_to_string(partial: "/orders/map_window_laundromat", locals: { order: @order }) }}]
  end

  def map_delivery
    @markers = [{lng: @order.longitude, lat: @order.latitude}, {lng: @order.laundromat.longitude, lat: @order.laundromat.latitude}]
  end

  private

  def orders_params
    authorize @order
  end

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end
end
