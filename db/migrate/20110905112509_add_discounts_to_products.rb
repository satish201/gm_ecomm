class AddDiscountsToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :discount, :integer
  end

  def self.down
    remove_column :products, :discount
  end
end
