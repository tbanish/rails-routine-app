class InstrumentsController < ApplicationController
  def index
    @instruments = current_user.instruments
  end

  def show
    @instrument = Instrument.find_by(id: params[:id])
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name)
  end
end
