class AddIndexToProfiles < ActiveRecord::Migration
  def self.up
    add_index :profiles , :user_id
  end

  def self.down
  end
end
