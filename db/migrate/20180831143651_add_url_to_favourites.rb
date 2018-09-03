class AddUrlToFavourites < ActiveRecord::Migration[5.2]
  def change
    add_column :favourites, :url, :text
  end
end
