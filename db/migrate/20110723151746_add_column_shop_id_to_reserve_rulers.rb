class AddColumnShopIdToReserveRulers < ActiveRecord::Migration
  def self.up
    add_column :reserve_rulers , :shop_id , :integer
    add_index :reserve_rulers , :shop_id
  end

  def self.down
  end
end
