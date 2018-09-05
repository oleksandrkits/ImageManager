class RemoveNameFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :Name, :string
  end
end
