#coding:utf-8
# user data of measures
class CreateMeasurements < ActiveRecord::Migration
  def self.up
    create_table :measurements do |t|
      t.string :name
      t.string :measure
      t.integer :popularity, :default => 0

      t.references :measure_property
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :measurements
  end
end
