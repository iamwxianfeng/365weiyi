#coding:utf-8
class CreateInquiries < ActiveRecord::Migration
  def self.up
    create_table :inquiries do |t|
      t.string :name  # reserved
      t.text :description
      t.boolean :approved, :default => false
      t.text :reply
      t.integer :replied_by
      t.integer :popularity, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inquiries
  end
end
