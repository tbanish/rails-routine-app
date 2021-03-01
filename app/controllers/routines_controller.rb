class RoutinesController < ApplicationController
  before_action :require_login, only: [:index, :show, :new, :edit]
  before_action :set_routine, only: [:show, :edit, :update, :destroy]

  def index
    @routines = current_user.routines
  end

  def show
    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def new
    @routine = Routine.new
    @routine.build_instrument
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.user_id = current_user.id

    if params[:routine][:instrument_id] == ""
      @instrument = Instrument.create_or_find_by(name: routine_params[:instrument_attributes][:name])
    else
      @instrument = Instrument.find_by(id: params[:routine][:instrument_id])
    end

    @routine.instrument_id = @instrument.id

    if @routine.save
      redirect_to routine_path(@routine)
    else
      render :new
    end
  end

  def edit
    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def update
    @routine.update(routine_params)

    if @routine.save
      redirect_to routine_path(@routine)
    else
      render :edit
    end
  end

  def destroy
    @routine.destroy
    redirect_to routines_path
  end

  private

  def routine_params
    params.require(:routine).permit(:name, :instrument_id, instrument_attributes: [:name])
  end

  def set_routine
    @routine = Routine.find_by(id: params[:id])
  end
end
