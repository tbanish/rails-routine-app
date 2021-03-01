module NotesHelper
  def date(note)
    note.created_at.localtime.strftime("%B %d, %Y")
  end
end
