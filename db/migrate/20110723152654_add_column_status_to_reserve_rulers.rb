class AddColumnStatusToReserveRulers < ActiveRecord::Migration
  def self.up
    add_column :reserve_rulers , :status , :integer
  end

  def self.down
  end
end
