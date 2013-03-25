class CreateTableTopReserveRulers < ActiveRecord::Migration
  def self.up
    create_table :top_rulers do |t|
      t.integer :user_id
      t.timestamps
    end
    add_index :top_rulers , :user_id
  end

  def self.down
  end
end
