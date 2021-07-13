module NotesHelper
  def date(note)
    note.created_at.localtime.strftime("%B %d, %Y")
  end

  def truncate(note)
    noteArray = note.content.split(" ")

    if noteArray.length < 8
      return note.content
    end
    
    array = []
    counter = 0

    while counter < 8 do
      array.push(noteArray[counter])
      counter += 1
    end

    array.join(" ") + " ..."
  end
end
