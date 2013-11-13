class AddColumnHeightToReserveRulers < ActiveRecord::Migration
  def self.up
    add_column :reserve_rulers, :height, :string
    add_column :reserve_rulers, :weight, :string
    add_column :reserve_rulers, :fee, :string
  end

  def self.down
  end
end
