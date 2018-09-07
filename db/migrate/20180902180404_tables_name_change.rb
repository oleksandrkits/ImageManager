class TablesNameChange < ActiveRecord::Migration[5.2]
  def change
    rename_table :Users, :users
  end
end
