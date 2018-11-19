module MasterNotesHelper

  def notes_total
    total = 0
    @master_note.notes.each do |note|
      total += note.value
    end
    return total
  end

end
