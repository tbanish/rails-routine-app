class ItemsController < ApplicationController
  def index
    @routine = Routine.find_by(id: params[:routine_id])
    @items = @routine.items
  end
end
