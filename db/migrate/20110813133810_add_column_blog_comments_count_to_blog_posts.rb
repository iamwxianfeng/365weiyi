class AddColumnBlogCommentsCountToBlogPosts < ActiveRecord::Migration
  def self.up
    add_column :blog_posts , :blog_comments_count,:integer
  end

  def self.down
  end
end
