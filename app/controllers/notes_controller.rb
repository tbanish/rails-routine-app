class NotesController < ApplicationController
  def show
    @routine = Routine.find_by(id: params[:routine_id])
    @item = Item.find_by(id: params[:item_id])
    @note = Note.find_by(id: params[:id])
  end

  def new
    @routine = Routine.find_by(id: params[:routine_id])
    @item = Item.find_by(id: params[:item_id])
    @note = Note.new
  end

  def create
    @routine = Routine.find_by(id: params[:routine_id])
    @item = Item.find_by(id: params[:item_id])
    @note = Note.new(note_params)

    if @note.save
      redirect_to routine_item_path(@routine, @item)
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :item_id)
  end
end
