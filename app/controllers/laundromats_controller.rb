class LaundromatsController < ApplicationController
  def index

    # @laundromats = @laundromats.near(params[:laundromat][:address], 5) unless params[:laundromat][:address].empty?

    if params[:price_cents]
      @laundromats = policy_scope(Laundromat).where("price_cents <= ?", params[:price_cents].to_i)
    else
      @laundromats = policy_scope(Laundromat)
   end


   if params[:distance]
     @laundromats = @laundromats.near(Geocoder.coordinates(params[:address]), params[:distance].to_i)
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
    @laundromat.save
    authorize @laundromat
  end

  def create

  end
end
