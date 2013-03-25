class ChangeColumnUsersRole < ActiveRecord::Migration
  def self.up
    change_column :users , :role , :integer , :default => 2
  end

  def self.down
  end
end
