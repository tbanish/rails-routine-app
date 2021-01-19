class ItemsController < ApplicationController
  def index
    @routine = Routine.find_by(id: params[:routine_id])
    @items = @routine.items
  end

  def show
    @item = Item.find_by(id: params[:id])
    @routine = Routine.find_by(id: params[:routine_id])
  end

  def new
    @routine = Routine.find_by(id: params[:routine_id])
    @item = @routine.items.build
  end
end
