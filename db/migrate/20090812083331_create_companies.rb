#coding:utf-8
class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name, :unique => true
      t.string :address
      t.string :phone
      t.string :website
      t.references :user
      t.integer :popularity, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
