class CreateTableReserveRulers < ActiveRecord::Migration
  def self.up
    create_table :reserve_rulers do |t|
      t.integer :user_id
      t.datetime :reserve_at
      t.integer :place_id
      t.string :office
      t.text :items
      t.string :phone
      
      t.timestamps
    end
    add_index :reserve_rulers , :user_id
    add_index :reserve_rulers , :place_id
  end

  def self.down
  end
end
