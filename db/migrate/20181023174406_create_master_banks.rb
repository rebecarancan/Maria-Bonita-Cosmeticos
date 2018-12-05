class CreateMasterBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :master_banks do |t|
      t.date :date
      t.integer :balance_cents

      t.timestamps
    end
  end
end
