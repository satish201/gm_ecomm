class RemoveColumns < ActiveRecord::Migration
  def self.up
    remove_column :users, :email, :crypted_password, :password_salt, :persistence_token

  end

  def self.down
    remove_column :users, :email, :crypted_password, :password_salt, :persistence_token

  end
end
