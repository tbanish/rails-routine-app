class RoutinesController < ApplicationController
  def index
    @routines = current_user.routines
  end

  def show
    @routine = Routine.find_by(id: params[:id])
  end

  def new
    @routine = Routine.new
    @routine.build_instrument
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.user_id = current_user.id

    if @routine.save
      redirect_to routine_path(@routine)
    else
      render :new
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:name, :instrument_id, instrument_attributes: [:name])
  end
end
