class AddNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :github, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
  end
end
