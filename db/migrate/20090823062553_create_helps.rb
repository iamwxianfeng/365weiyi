#coding:utf-8
class CreateHelps < ActiveRecord::Migration
  def self.up
    create_table :helps do |t|
      t.string :name, :default => ''
      t.string :title, :default => ''
      t.text :description, :default => ''

      t.timestamps
    end
  end

  def self.down
    drop_table :helps
  end
end
