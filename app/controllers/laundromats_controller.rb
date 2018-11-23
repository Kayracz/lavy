class LaundromatsController < ApplicationController
  def index
    @laundromats = policy_scope(Laundromat)
    @laundromats = @laundromats.near(params[:laundromat][:address], 5) unless params[:laundromat][:address].empty?

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
end
