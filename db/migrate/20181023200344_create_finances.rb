class CreateFinances < ActiveRecord::Migration[5.2]
  def change
    create_table :finances do |t|
      t.date :day
      t.string :description
      t.monetize :value
      t.references :expense_type, foreign_key: true
      t.references :record_type, foreign_key: true

      t.timestamps
    end
  end
end
