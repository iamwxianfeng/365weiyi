#coding:utf-8
class AddColumnMaterialPictureToProducts < ActiveRecord::Migration
  def self.up
    add_column :products , :material_picture , :string
  end

  def self.down
  end
end
