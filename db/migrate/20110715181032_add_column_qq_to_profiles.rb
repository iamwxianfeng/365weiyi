class AddColumnQqToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles , :qq , :integer
  end

  def self.down
  end
end
