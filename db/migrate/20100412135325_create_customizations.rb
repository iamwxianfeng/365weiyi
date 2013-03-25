#coding:utf-8
class CreateCustomizations < ActiveRecord::Migration
  def self.up
    create_table :customizations do |t|
      t.string :name
      t.text :description
      t.string :category, :default => '领型'
      t.string :photo, :default => '/images/l1.jpg'
      t.integer :popularity, :default => 0

      t.references :measure_page

      t.timestamps
    end
  end

  def self.down
    drop_table :customizations
  end
end
