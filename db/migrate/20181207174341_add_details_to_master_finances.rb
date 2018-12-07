class AddDetailsToMasterFinances < ActiveRecord::Migration[5.2]
  def change
    rename_column :master_finances, :balance_cents, :initial_balance_cents
    add_column :master_finances, :final_balance_cents, :integer
  end
end
