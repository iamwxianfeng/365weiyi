#coding:utf-8
class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.decimal :price, :default => 0
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
