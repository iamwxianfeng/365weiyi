#coding:utf-8
class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.string :url, :unique => true, :default => 'suit'
      t.integer :popularity, :default => 0
      t.string :logo
      t.integer :subcategories_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
