#coding:utf-8
class AddColumnContactToProducts < ActiveRecord::Migration
  def self.up
    add_column :products , :contact , :string # 咨询方式
    add_column :products , :for_who , :string # 适用人群
    add_column :products , :for_where , :string # 适用场合
    add_column :products , :weight , :string # 克重
  end

  def self.down
  end
end
