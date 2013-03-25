class CreateTableBlogComments < ActiveRecord::Migration 
  def self.up
    create_table :blog_comments do |t| # blog 评论
      t.integer :blog_post_id
      t.integer :user_id
      t.text :content      
      
      t.timestamps
    end
    add_index :blog_comments , :blog_post_id
    add_index :blog_comments , :user_id
  end

  def self.down
  end
end
