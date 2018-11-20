class LaundromatsController < ApplicationController
  def index
    @laundromats = policy_scope(Laundromat).order(created_at: :desc)

    @map_laundromats = Laundromat.where.not(latitude: nil, longitude: nil)
    @markers = @map_laundromats.map do |laundromat|
      {
        lng: laundromat.longitude,
        lat: laundromat.latitude,
        infoWindow: { content: render_to_string(partial: "/laundromats/map_window", locals: { laundromat: laundromat}) }
      }
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
   @laundromat = Laundromat.find(params[:id])
   authorize @laundromat
  end
end
