#coding:utf-8
class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name, :address, :zipcode, :website, :institution, :phone

      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
