#coding:utf-8
class CreateCustomizationWraps < ActiveRecord::Migration
  def self.up
    create_table :customization_wraps do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :customization_wraps
  end
end
