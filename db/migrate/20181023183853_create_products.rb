class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :code
      t.string :name
      t.integer :cost_cents
      t.integer :price_cents
      t.integer :margin

      t.timestamps
    end
  end
end
