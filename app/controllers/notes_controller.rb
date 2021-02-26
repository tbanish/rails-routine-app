class NotesController < ApplicationController
  before_action :require_login, only: [:show, :new, :edit]
  before_action :set_routine

  def show
    @item = Item.find_by(id: params[:item_id])
    @note = Note.find_by(id: params[:id])

    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def new
    @item = Item.find_by(id: params[:item_id])
    @note = Note.new

    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @note = Note.new(note_params)

    if @note.save
      redirect_to routine_item_path(@routine, @item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find_by(id: params[:item_id])
    @note = Note.find_by(id: params[:id])

    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def update
    @note = Note.find_by(id: params[:id])
    @item = Item.find_by(id: params[:item_id])
    @note.update(note_params)

    if @note.save
      redirect_to routine_item_path(@routine, @item)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    @item = Item.find_by(id: params[:item_id])
    @note.destroy

    redirect_to routine_item_path(@routine, @item)
  end

  private

  def note_params
    params.require(:note).permit(:content, :item_id)
  end
end
