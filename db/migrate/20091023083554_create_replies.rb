#coding:utf-8
class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.string :name
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :replies
  end
end
