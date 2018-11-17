class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :day
      t.integer :value_cents
      t.references :income_type, foreign_key: true
      t.references :master_sale, foreign_key: true

      t.timestamps
    end
  end
end
