class AddIndexToProducts < ActiveRecord::Migration[5.2]
  def change
    add_index :products, :name
    add_index :products, :code
  end
end
