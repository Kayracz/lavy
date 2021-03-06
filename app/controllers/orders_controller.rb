class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  before_action :set_order, except: [:new, :create]

  def show
  end

  def new
    @laundromat = Laundromat.find(params[:laundromat_id])
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new
    @order.pick_up_time = orders_params[:pick_up_time] + " " + orders_params[:pick_up_time_hs]
    @order.delivery_time = orders_params[:delivery_time] + " " + orders_params[:delivery_time_hs]
    @order.number_of_bags = orders_params[:number_of_bags]
    @order.status = "pending"
    @order.address = orders_params[:address]
    @laundromat = Laundromat.find(params[:laundromat_id])
    @order.laundromat = @laundromat
    @order.user = current_user
    @order.delivery_guy = User.find_by(role: true)
    @order.pick_up_guy = User.find_by(role: true)
    @order.amount = @laundromat.price * @order.number_of_bags
     # Nick comment: need to authorize order before we save it??
    authorize @order
    if @order.save
      authorize @order
      redirect_to new_order_payment_path(@order) # edited by Nick, dont need nesting
    else
      render :new
    end
  end

  def update
  end

  def update_picked
    @order.update(status: params[:status])
    # redirect_to dashboard_path # if this line were active the ajax wouldnt work, because it would force the HTML

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js # <-- will render `app/views/orders/update_picked.js.erb`
    end
  end

  def update_delivered
    @order.update(status: params[:status])
    # redirect_to dashboard_path

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def update_removed
    @order.update(status: params[:status])

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def destroy
    @order.reviews.destroy_all
    @order.destroy

      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end

    # @order.reviews.destroy_all  # We need to destroy all the children before we destroy the parent
    # @order.destroy              # Otherwise, we'll have references in the children to a parent id which doesn't exist
    # redirect_to dashboard_path
  end

  def map_pick_up
    # @location = request.location  # Had to comment the request location out because it wasnt precise
    # location_lat = @location.latitude
    # location_lng = @location.longitude
    # if @location.latitude.nil?
      location_lat = -34.592742.to_f # La maquinita palermo soho coordinates
      location_lng = -58.430740.to_f
    # end
    # @location.longitude
    @markers = [{lng: @order.longitude, lat: @order.latitude, infoWindow: { content: render_to_string(partial: "/orders/map_window_client", locals: { order: @order }) }}, {lng: @order.laundromat.longitude, lat: @order.laundromat.latitude, infoWindow: { content: render_to_string(partial: "/orders/map_window_laundromat", locals: { order: @order }) }}, {lng: location_lng, lat: location_lat, infoWindow: { content: render_to_string(partial: "/orders/map_window_location", locals: { order: @order }) }}]

  end

  def map_delivery
    #@location = request.location
    #location_lat = @location.latitude
    #location_lng = @location.longitude
    #if @location.latitude.nil?
    #  location_lat = -34.592742.to_f # La maquinita palermo soho coordinates
    #  location_lng = -58.430740.to_f
    #end
    #@location.longitude
    @markers = [{lng: @order.longitude, lat: @order.latitude, infoWindow: { content: render_to_string(partial: "/orders/map_window_client", locals: { order: @order }) }}, {lng: @order.laundromat.longitude, lat: @order.laundromat.latitude, infoWindow: { content: render_to_string(partial: "/orders/map_window_laundromat", locals: { order: @order }) }}]
  end

  private

  def orders_params
    params.require(:order).permit(:pick_up_time_hs, :delivery_time_hs, :service_type, :pick_up_time, :delivery_time, :number_of_bags, :address, :status)
  end

  def set_order
    @order = Order.find(params[:id])
    authorize @order
  end

end


