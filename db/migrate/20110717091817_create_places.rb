#coding:utf-8

##
# 每个地区只有一个量体师,一个量体师可以有多个地区
class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :provice # 省
      t.string :city # 市
      t.string :area # 区
      t.string :street # 街道
      t.integer :user_id # 量体师

      t.timestamps
    end
    add_index :places , :user_id
  end

  def self.down
    drop_table :places
  end
end
