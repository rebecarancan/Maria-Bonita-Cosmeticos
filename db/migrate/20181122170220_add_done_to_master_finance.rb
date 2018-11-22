class AddDoneToMasterFinance < ActiveRecord::Migration[5.2]
  def change
    add_column :master_finances, :done, :boolean, default: false
  end
end
