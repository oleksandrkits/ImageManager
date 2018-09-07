class AddAdressReferencesToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :adress, foreign_key: true
  end
end
