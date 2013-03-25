#coding:utf-8
class TopRuler < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id , :presence => {message: "量体师不能为空" }
  
  before_create do
    TopRuler.destroy_all(:user_id=>user_id)
  end
  
end