#coding:utf-8
class Place < ActiveRecord::Base
  
  belongs_to :user
  has_many :reserve_rulers
  
  validates :provice , :presence => { message: "省份不能为空" }
  validates :user_id , :presence => { message: "量体师不能为空" }
  
  def human_user
    Profile.find_by_user_id(user_id).try(:name)
  end
  
end
