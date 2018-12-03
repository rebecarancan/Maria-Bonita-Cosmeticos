module MasterNotesHelper

  def notes_total(obj)
    obj.sum(&:value)
  end

end
