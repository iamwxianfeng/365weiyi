#coding:utf-8
class AddHeightAndFigureToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :height, :string
    #fat or thin
    add_column :profiles, :figure, :string
  end

  def self.down
    remove_column :profiles, :height
    remove_column :profiles, :figure
  end
end
