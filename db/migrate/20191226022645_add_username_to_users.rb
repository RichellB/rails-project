class AddUsernameToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :company, :string
  end
end