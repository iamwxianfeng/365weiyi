#coding:utf-8
class CreateMeasureCategories < ActiveRecord::Migration
  def self.up
    create_table :measure_categories do |t|
      t.string :name #西服上衣，西服裤子，衬衫
      t.integer :popularity, :default => 0
      t.string :url #reserved for generating url

      t.timestamps
    end
  end

  def self.down
    drop_table :measure_categories
  end
end
