#coding:utf-8
class BlogComment < ActiveRecord::Base
  belongs_to :blog_post , :counter_cache => true
  belongs_to :user
end