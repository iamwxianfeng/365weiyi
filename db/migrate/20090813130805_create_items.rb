#coding:utf-8
class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.decimal :price, :default => 0
      t.integer :quantity, :default => 1, :null => false
      t.decimal :total_price, :null => false, :precision => 8,
        :scale => 2, :default => 0
      t.string :measure, :default => ''
      t.integer :product_id, :null => false, :options =>
        "CONSTRAINT fk_item_product REFERENCES products(id)"
      t.integer :order_id, :null => false, :options =>
        "CONSTRAINT fk_item_order REFERENCES orders(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
