class CreateMasterFinances < ActiveRecord::Migration[5.2]
  def change
    create_table :master_finances do |t|
      t.string :month
      t.integer :year
      t.integer :balance_cents

      t.timestamps
    end
  end
end
