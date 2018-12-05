class CreateMasterOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :master_orders do |t|
      t.date :date

      t.timestamps
    end
  end
end
