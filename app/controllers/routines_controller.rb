class RoutinesController < ApplicationController
  def index
    @routines = current_user.routines
  end

  def show
    @routine = Routine.find_by(id: params[:id])
  end
end
