class CreateMalladminSessions < ActiveRecord::Migration
  def self.up
    create_table :malladmin_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :malladmin_sessions
  end
end
