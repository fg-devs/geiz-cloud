class ChangeTableUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string
    remove_column :users, :admin
  end
end
