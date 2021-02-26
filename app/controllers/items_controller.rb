class ItemsController < ApplicationController
  before_action :require_login, only: [:index, :show, :new, :edit]
  before_action :set_routine

  def index
    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    else
      @items = @routine.items
    end
  end

  def show
    @item = Item.find_by(id: params[:id])

    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def new
    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    else
      @item = @routine.items.build
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to routine_items_path(@routine)
    else
      render :new
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])

    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.update(item_params)

    if @item.save
      redirect_to routine_item_path(@routine, @item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    redirect_to routine_items_path(@routine)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :goal, :routine_id)
  end

  def set_routine
    @routine = Routine.find_by(id: params[:routine_id])
  end
end
