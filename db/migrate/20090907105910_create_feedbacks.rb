#coding:utf-8
class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.string :name, :default => '匿名'
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
