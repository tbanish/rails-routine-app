class RoutinesController < ApplicationController
  def index
    @routines = current_user.routines
  end
end
