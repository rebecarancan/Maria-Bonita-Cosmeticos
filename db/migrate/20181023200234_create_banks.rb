class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.date :day
      t.integer :value_cents
      t.references :income_type, foreign_key: true
      t.references :record_type, foreign_key: true

      t.timestamps
    end
  end
end
