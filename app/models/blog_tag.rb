#coding:utf-8
class BlogTag < ActiveRecord::Base
  validates :name , :presence=>{ message: "标签名字不能为空" } #, :uniqueness=>{ message: "标签名字已经存在" }

  belongs_to :blog_post
end

