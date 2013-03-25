#coding:utf-8
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :options => 'auto_increment = 10000' do |t|
      t.string :email, :null => false, :unique => true
      t.string :crypted_password, :limit => 40
      t.string :salt, :limit => 40
      t.string :remember_token
      t.datetime :remember_token_expires_at

      t.integer :credit, :default => 0
      t.decimal :discount, :default => 1,
        :precision => 6, :scale => 2
      t.string :role , :default => '会员'  # '管理员'
      t.boolean :is_company, :default => false
      t.string :login_from
      t.datetime :login_at
      t.integer :orders_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
