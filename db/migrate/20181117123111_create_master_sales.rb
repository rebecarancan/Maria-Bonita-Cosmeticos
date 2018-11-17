class CreateMasterSales < ActiveRecord::Migration[5.2]
  def change
    create_table :master_sales do |t|
      t.integer :year
      t.string :month
      t.integer :balance_cents

      t.timestamps
    end
  end
end
