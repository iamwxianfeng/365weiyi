#coding:utf-8
class CreateMeasureProperties < ActiveRecord::Migration
  def self.up
    create_table :measure_properties do |t|
      t.string :name
      t.text :description  # 量体说明
      t.string :photo  # 示例图片
      t.string :unit, :default => "CM"  #测量单位
      t.integer :popularity, :default => 0

      t.references :measure_page

      t.timestamps
    end
  end

  def self.down
    drop_table :measure_properties
  end
end
