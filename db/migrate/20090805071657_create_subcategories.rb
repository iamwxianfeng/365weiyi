#coding:utf-8
class CreateSubcategories < ActiveRecord::Migration
  def self.up
    create_table :subcategories do |t|
      t.string :name
      t.string :url, :default => 'man'
      t.integer :popularity
      t.integer :products_count
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :subcategories
  end
end
