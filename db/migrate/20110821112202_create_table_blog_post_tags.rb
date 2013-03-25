#coding:utf-8
class CreateTableBlogPostTags < ActiveRecord::Migration
  def self.up
    create_table :blog_post_tags do |t| # blog_posts , blog_tags 中间表
      t.integer :blog_post_id
      t.integer :blog_tag_id
      t.timestamps
    end
  end

  def self.down
  end
end
