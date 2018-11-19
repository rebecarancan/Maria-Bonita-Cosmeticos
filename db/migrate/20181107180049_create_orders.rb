class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :purchase
      t.string :distributor
      t.date :expire
      t.integer :value_cents
      t.integer :payment
      t.references :master_order, foreign_key: true

      t.timestamps
    end
  end
end
