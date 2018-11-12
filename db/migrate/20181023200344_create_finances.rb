class CreateFinances < ActiveRecord::Migration[5.2]
  def change
    create_table :finances do |t|
      t.date :day
      t.string :description
      t.integer :value_cents
      t.references :income_type, foreign_key: true
      t.references :expense_type, foreign_key: true
      t.references :master_finance, foreign_key: true

      t.timestamps
    end
  end
end
