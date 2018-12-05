class CreateMasterFinances < ActiveRecord::Migration[5.2]
  def change
    create_table :master_finances do |t|
      t.date :date
      t.integer :balance_cents

      t.timestamps
    end
  end
end
