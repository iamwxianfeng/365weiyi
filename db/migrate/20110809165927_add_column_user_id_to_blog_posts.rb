class AddColumnUserIdToBlogPosts < ActiveRecord::Migration
  def self.up
    add_column :blog_posts , :user_id , :integer
    add_column :blog_posts , :published , :boolean
    
    add_index :blog_posts , :user_id
  end

  def self.down
  end
end
