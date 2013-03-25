class AddColumnPicturesShowToProducts < ActiveRecord::Migration
  def self.up
    add_column :products,:pictures_show,:text
  end

  def self.down
  end
end
