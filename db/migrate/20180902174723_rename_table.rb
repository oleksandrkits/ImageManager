class RenameTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :favourites, :Favourites
  end
end
