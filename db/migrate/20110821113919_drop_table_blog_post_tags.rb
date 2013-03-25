#coding:utf-8
class DropTableBlogPostTags < ActiveRecord::Migration
  def self.up
    drop_table :blog_post_tags # blog_posts 和 blog_tags 改为 1-n 关系,去掉 n-n 关系
    
    add_column :blog_tags , :blog_post_id , :integer
  end

  def self.down
  end
end
