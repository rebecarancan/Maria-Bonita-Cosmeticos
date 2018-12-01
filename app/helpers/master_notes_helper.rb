module MasterNotesHelper

  def notes_total
    @master_note.notes.sum(&:value)
  end

end
