class ItemsController < ApplicationController
  before_action :require_login, only: [:index, :show, :new, :edit]
  before_action :set_routine
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    else
      @items = @routine.items
    end
  end

  def show
    @next = @routine.next_item(@item)
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
    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def update
    @item.update(item_params)

    if @item.save
      redirect_to routine_item_path(@routine, @item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to routine_items_path(@routine)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :goal, :routine_id)
  end

  def set_item
    @item = Item.find_by(id: params[:id])
  end
end
