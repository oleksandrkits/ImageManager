class RemoveAdressFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :adress, foreign_key: true
  end
end
