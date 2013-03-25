#coding:utf-8
class CreateMeasurePages < ActiveRecord::Migration
  def self.up
    create_table :measure_pages do |t|
      t.string :name
      t.text :description
      t.string :favorite_brand
      t.integer :popularity, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :measure_pages
  end
end

