class CreateBlogPosts < ActiveRecord::Migration
  def self.up
    create_table :blog_posts do |t| # blog post
      t.string :title
      t.text :content
      t.integer :category_id
      t.integer :product1_id # 推荐product 1
      t.integer :product2_id # 推荐product 2

      t.timestamps
    end
    add_index :blog_posts , :category_id
    add_index :blog_posts , :product1_id
    add_index :blog_posts , :product2_id
  end

  def self.down
    drop_table :blog_posts
  end
end
