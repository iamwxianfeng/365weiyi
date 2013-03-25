#coding:utf-8
class BlogCategory < ActiveRecord::Base
  validates :name , :presence=>{ message: "分类名字不能为空" } , :uniqueness => { message: "分类名字已经存在" }
end
