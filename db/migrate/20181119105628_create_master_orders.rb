class CreateMasterOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :master_orders do |t|
      t.integer :year
      t.string :month

      t.timestamps
    end
  end
end
