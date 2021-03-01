class InstrumentsController < ApplicationController
  before_action :require_login, only: [:index, :show]

  def index
    @instruments = current_user.instruments
  end

  def show
    @instrument = Instrument.find_by(id: params[:id])

    if !@instrument || !current_user.instrument_ids.include?(@instrument.id)
      redirect_to instruments_path
    else
      @routines = @instrument.routines.collect{|routine| routine if routine.user == current_user}.compact
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name)
  end
end
