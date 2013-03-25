#coding:utf-8
class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :name, :default => ''
      t.string :photo_url, :default => '/images/flash_img.gif'
      t.string :link_to, :default => '#'
      t.integer :popularity, :default => 0
      t.boolean :can_scroll, :default => true  # scrolling banner or promotion ad?

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
