class AddTotalCentsToMasterFinance < ActiveRecord::Migration[5.2]
  def change
    add_column :master_finances, :total_cents, :integer
  end
end
