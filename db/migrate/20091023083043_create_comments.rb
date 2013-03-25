#coding:utf-8
class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name, :null => false
      t.integer :popularity, :default => 0
      t.boolean :approved, :default => false
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
