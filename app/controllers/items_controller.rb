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

  def create
    @routine = Routine.find_by(id: params[:routine_id])
    @item = Item.new(item_params)
    if @item.save
      redirect_to routine_items_path(@routine)
    else
      redirect_to :new
    end
  end

  def edit
    @routine = Routine.find_by(id: params[:routine_id])
    @item = Item.find_by(id: params[:id])
  end

  def update
    @routine = Routine.find_by(id: params[:routine_id])
    @item = Item.find_by(id: params[:id])
    @item.update(item_params)

    if @item.save
      redirect_to routine_item_path(@routine, @item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :goal, :routine_id)
  end
end
