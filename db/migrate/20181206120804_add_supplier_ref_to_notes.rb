class AddSupplierRefToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :supplier, foreign_key: true
  end
end
