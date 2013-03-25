class AddColumnReserveIdToReserveRulers < ActiveRecord::Migration
  def self.up
    add_column :reserve_rulers , :reserve_id , :integer # 会员id
    add_index :reserve_rulers , :reserve_id
  end

  def self.down
  end
end
