class EditUserToken < ActiveRecord::Migration
  def change
    remove_column :users, :token
    add_column :users, :token, :string
  end
end
