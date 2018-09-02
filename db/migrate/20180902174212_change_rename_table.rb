class ChangeRenameTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :Users
  end
end
