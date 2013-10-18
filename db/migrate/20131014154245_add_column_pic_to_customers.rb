class AddColumnPicToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :pic1, :string
    add_column :customers, :pic2, :string
  end

  def self.down
  end
end
