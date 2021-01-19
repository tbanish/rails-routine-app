class NotesController < ApplicationController
  def show
    @routine = Routine.find_by(id: params[:routine_id])
    @item = Item.find_by(id: params[:item_id])
    @note = Note.find_by(id: params[:id])
  end

  private

  def note_params
    params.require(:note).permit(:content, :item_id)
  end
end
