class CreateMallmanageradminSessions < ActiveRecord::Migration
  def self.up
    create_table :mallmanageradmin_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :mallmanageradmin_sessions
  end
end
