class LaundromatsController < ApplicationController
  def index
  end

  def show
    @laundromat = Laundromat.find(params[:id])
  end

  def destroy
  end
end
