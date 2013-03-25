#coding:utf-8
class Shop < ActiveRecord::Base
  has_many :reserve_rulers
  
  validates :name , :presence => { message: "店名不能为空" } , :uniqueness=>{ message: "店名已经存在" }
  
end
