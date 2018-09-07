class AddColumnsToAdress < ActiveRecord::Migration[5.2]
  def change
    add_column :adresses, :city, :string
    add_column :adresses, :street, :string
    add_column :adresses, :home_number, :integer
  end
end
