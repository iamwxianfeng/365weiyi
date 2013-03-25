class AddColumnWeiboToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles , :weibo , :string
  end

  def self.down
  end
end
