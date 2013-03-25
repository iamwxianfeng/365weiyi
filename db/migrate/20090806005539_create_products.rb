#coding:utf-8
class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products, :options => 'auto_increment = 10000' do |t|
      t.string :name
      t.string :serial_number
      t.string :origin
      t.string :component
      t.string :yarn
      t.string :color
      t.text :description  # 款式说明
      t.text :details  # 产品描述
      t.decimal :market_price
      t.decimal :our_price
      #尺码
      t.string :measure, :default => ''
      t.references :subcategory
      t.integer :popularity, :default => 0
      #available for sale?
      t.boolean :availability, :default => true, :null => false

      t.integer :photos_count, :default => 0
      t.integer :comments_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
