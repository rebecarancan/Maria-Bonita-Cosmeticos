class RemoveDistributorFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :distributor, :string
  end
end
