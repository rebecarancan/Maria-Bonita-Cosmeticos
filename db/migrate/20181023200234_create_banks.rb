class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.date :day
      t.string :description
      t.integer :value_cents
      t.references :master_bank, foreign_key: true
      t.references :income_type, foreign_key: true
      t.references :expense_type, foreign_key: true

      t.timestamps
    end
  end
end
