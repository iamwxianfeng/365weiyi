#coding:utf-8
class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :name
      t.string :description
      t.string :url, :default => 'http://www.dooxoo.cn'
      t.string :logo, :default => '/images/link_defaut.gif'

      t.boolean :approved, :default => false
      t.integer :popularity, :default => 0
      t.integer :user_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
