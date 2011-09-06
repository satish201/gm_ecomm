class CreateMallmanagers < ActiveRecord::Migration
  def self.up
    create_table :mallmanagers do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token

      t.timestamps
    end
  end

  def self.down
    drop_table :mallmanagers
  end
end
