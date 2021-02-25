class RoutinesController < ApplicationController
  before_action :require_login, only: [:index, :show, :new, :edit]

  def index
    @routines = current_user.routines
  end

  def show
    @routine = Routine.find_by(id: params[:id])

    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def new
    @routine = Routine.new
    @routine.build_instrument
  end

  def create
    @instrument = Instrument.create_or_find_by(name: routine_params[:instrument_attributes][:name])
    @routine = Routine.new(routine_params)
    @routine.instrument_id = @instrument.id
    @routine.user_id = current_user.id
    
    if @routine.save
      redirect_to routine_path(@routine)
    else
      render :new
    end
  end

  def edit
    @routine = Routine.find_by(id: params[:id])

    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def update
    @routine = Routine.find_by(id: params[:id])
    @routine.update(routine_params)

    if @routine.save
      redirect_to routine_path(@routine)
    else
      render :edit
    end
  end

  def destroy
    @routine = Routine.find_by(id: params[:id])
    @routine.destroy
    redirect_to routines_path
  end

  private

  def routine_params
    params.require(:routine).permit(:name, :instrument_id, instrument_attributes: [:name])
  end
end
