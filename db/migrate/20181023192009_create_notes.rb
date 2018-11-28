class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.date :day
      t.string :name
      t.integer :value_cents
      t.references :master_note, foreign_key: true

      t.timestamps
    end
  end
end
