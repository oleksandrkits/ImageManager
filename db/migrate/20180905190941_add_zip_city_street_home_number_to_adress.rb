class AddZipCityStreetHomeNumberToAdress < ActiveRecord::Migration[5.2]
  def change
    add_column :adresses, :zip, :integer
  end
end
