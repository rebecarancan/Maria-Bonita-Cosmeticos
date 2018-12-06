class AddSupplierRefToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :supplier, foreign_key: true
  end
end
