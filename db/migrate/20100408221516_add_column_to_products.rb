#coding:utf-8
class AddColumnToProducts < ActiveRecord::Migration
  def self.up
    # 定制或成衣
    add_column :products, :customizable, :boolean, :default => false
  end

  def self.down
    remove_column :products, :customizable
  end
end
