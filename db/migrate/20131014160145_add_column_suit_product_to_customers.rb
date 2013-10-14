class AddColumnSuitProductToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :suit_product1, :integer
    add_column :customers, :suit_product2, :integer
    add_column :customers, :suit_product3, :integer

    add_column :customers, :shirt_product1, :integer
    add_column :customers, :shirt_product2, :integer
    add_column :customers, :shirt_product3, :integer

    add_column :customers, :other_product1, :integer
    add_column :customers, :other_product2, :integer
    add_column :customers, :other_product3, :integer
  end

  def self.down
  end
end
