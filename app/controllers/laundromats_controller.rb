class LaundromatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # @laundromats = @laundromats.near(params[:laundromat][:address], 5) unless params[:laundromat][:address].empty?
    if params[:price_cents]
      @laundromats = policy_scope(Laundromat).where("price_cents <= ?", params[:price_cents].to_i).reverse_order
    else
      @laundromats = policy_scope(Laundromat).reverse_order
    end

    if params[:distance]
      @laundromats = @laundromats.near(Geocoder.coordinates(params[:address]), params[:distance].to_i).reverse_order
    else
      @laundromats
    end

    if params[:stars]
      @laundromats = policy_scope(Laundromat).minimum_stars(params[:stars].to_i).reverse
    else
      @laundromats
    end

    @markers = @laundromats.map do |laundromat|
      {
        lng: laundromat.longitude,
        lat: laundromat.latitude,
        infoWindow: { content: render_to_string(partial: "/laundromats/map_window", locals: { laundromat: laundromat}) }
      }
    end
  end

  def show
    @laundromat = Laundromat.find(params[:id])
    @markers =
    {
      lng: @laundromat.longitude,
      lat: @laundromat.latitude,
      infoWindow: { content: render_to_string(partial: "/laundromats/map_window", locals: { laundromat: @laundromat}) }
    }
    authorize @laundromat
  end

  def new
    @laundromat = Laundromat.new
    authorize @laundromat
  end

  def create
    @laundromat = Laundromat.new(laundromat_params)
    @laundromat.price_cents = @laundromat.price_cents * 100
    authorize @laundromat
    return redirect_to laundromats_path if @laundromat.save
    render :new
  end

  private

  def laundromat_params
    params.require(:laundromat).permit(:name, :address, :phone_number, :bags_per_day, :price_cents, :stars, :photo)
  end
end
