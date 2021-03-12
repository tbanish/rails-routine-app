class NotesController < ApplicationController
  before_action :require_login, only: [:show, :new, :edit]
  before_action :set_routine
  before_action :set_item
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def show
    if !@note || @note.item.routine.user != current_user || !@item.notes.include?(@note) || @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def new
    @note = Note.new

    if @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to routine_item_path(@routine, @item)
    else
      render :new
    end
  end

  def edit
    if !@note || @note.item.routine.user != current_user || @routine == nil || current_user != @routine.user
      redirect_to user_path(current_user)
    end
  end

  def update
    @note.update(note_params)

    if @note.save
      redirect_to routine_item_path(@routine, @item)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy

    redirect_to routine_item_path(@routine, @item)
  end

  private

  def note_params
    params.require(:note).permit(:content, :item_id)
  end

  def set_note
    @note = Note.find_by(id: params[:id])
  end
end
