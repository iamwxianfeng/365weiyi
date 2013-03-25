#coding:utf-8
class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :name
      t.string :url
      t.integer :popularity, :default => 0

      t.string :mark  #reserved
      t.references :product

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
