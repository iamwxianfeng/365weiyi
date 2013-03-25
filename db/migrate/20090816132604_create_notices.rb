#coding:utf-8
class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices do |t|
      t.string :name, :default => '', :null => false
      t.string :url
      t.text :description, :default => '', :limit => 3000
      #访问量
      t.integer :hit, :default => 0
      t.integer :popularity, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :notices
  end
end
