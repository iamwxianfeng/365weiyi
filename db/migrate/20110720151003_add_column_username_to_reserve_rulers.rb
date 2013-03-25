class AddColumnUsernameToReserveRulers < ActiveRecord::Migration
  def self.up
    add_column :reserve_rulers , :username , :string
  end

  def self.down
  end
end
