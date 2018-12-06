class RemoveNameFromNotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :notes, :name, :string
  end
end
