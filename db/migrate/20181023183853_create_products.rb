class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :code
      t.string :name
      t.monetize :cost
      t.monetize :price
      t.integer :margin

      t.timestamps
    end
  end
end
