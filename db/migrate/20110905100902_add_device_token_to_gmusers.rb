class AddDeviceTokenToGmusers < ActiveRecord::Migration
  def self.up
    add_column :gmusers, :device_token, :string
  end

  def self.down
    remove_column :gmusers, :device_token
  end
end
