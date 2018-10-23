class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.date :day
      t.string :name
      t.monetize :value

      t.timestamps
    end
  end
end
