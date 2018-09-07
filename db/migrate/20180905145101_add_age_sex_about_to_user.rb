class AddAgeSexAboutToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :sex, :integer
    add_column :users, :about, :text
  end
end
