#coding:utf-8
class CreateKadminComments < ActiveRecord::Migration
  def self.up
    create_table :kadmin_comments do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :kadmin_comments
  end
end
