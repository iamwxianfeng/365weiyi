class CreateBlogTags < ActiveRecord::Migration
  def self.up
    create_table :blog_tags do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :blog_tags
  end
end
