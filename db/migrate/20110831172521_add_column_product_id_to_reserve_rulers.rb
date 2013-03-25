class AddColumnProductIdToReserveRulers < ActiveRecord::Migration
  def self.up
    add_column :reserve_rulers , :product_id , :integer 
  end

  def self.down
  end
end
