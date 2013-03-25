#coding:utf-8
class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :name, :null => false
      t.string :address, :default => '好好啊'
      t.string :zipcode
      t.string :phone
      t.string :payment, :default => Order::CASH
      t.string :extra_information
      t.string :shipping, :default => '自取'

      t.string :appointment

      #已完成,在处理,已取消
      t.string :progress, :default => Order::PENDING
      t.decimal :discount, :default => 1,
        :precision => 6, :scale => 2
      #折后价
      t.decimal :total_price, :null => false, :precision => 8,
        :scale => 2, :default => 0
      t.integer :items_count, :default => 0

      t.references :user #owner of order
      t.references :operator #who modified the order?

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
