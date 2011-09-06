class AddRetailersIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :retailer_id, :integer
  end

  def self.down
    remove_column :products, :retailer_id
  end
end
