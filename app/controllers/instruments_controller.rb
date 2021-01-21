class InstrumentsController < ApplicationController
  before_action :require_login, only: [:index, :show]

  def index
    @instruments = current_user.instruments
  end

  def show
    @instrument = Instrument.find_by(id: params[:id])

    if !current_user.instruments.include?(@instrument)
      redirect_to instruments_path
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name)
  end
end
