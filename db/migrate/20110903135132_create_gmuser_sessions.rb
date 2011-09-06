class CreateGmuserSessions < ActiveRecord::Migration
  def self.up
    create_table :gmuser_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :gmuser_sessions
  end
end
