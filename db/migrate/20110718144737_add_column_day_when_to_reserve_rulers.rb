class AddColumnDayWhenToReserveRulers < ActiveRecord::Migration
  def self.up
    add_column :reserve_rulers , :day_when , :string
  end

  def self.down
  end
end
