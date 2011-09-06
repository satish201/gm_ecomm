class CreateMalls < ActiveRecord::Migration
  def self.up
    create_table :malls do |t|
      t.string :mallname
      t.string :city
      t.string :country
      t.text :address
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :malls
  end
end
