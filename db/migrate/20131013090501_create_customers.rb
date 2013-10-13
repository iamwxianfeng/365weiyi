class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :height
      t.string :weight
      t.string :job
      t.string :like
      t.integer :style, :default => 0
      t.integer :other_style, :default => 0
      t.text :desp

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
