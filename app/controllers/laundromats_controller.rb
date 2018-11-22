class LaundromatsController < ApplicationController
  def index
    # params[:address]
    # SEARCH BY ADDRESS
    @laundromats = policy_scope(Laundromat,laundromat_params[:address], 10))
  end

  def show
    @laundromat = Laundromat.find(params[:id])
    @markers = [
      {
          lng: @laundromat.longitude,
          lat: @laundromat.latitude,
          infoWindow: { content: render_to_string(partial: "/laundromats/map_window", locals: { laundromat: @laundromat}) }
        }
    ]
   authorize @laundromat
  end

  private

  def laundromat_params
    params.require(:laundromat).permit(:address)
  end
end
