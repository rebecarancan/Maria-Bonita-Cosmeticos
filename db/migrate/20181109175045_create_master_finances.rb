class CreateMasterFinances < ActiveRecord::Migration[5.2]
  def change
    create_table :master_finances do |t|
      t.string :month

      t.timestamps
    end
  end
end
