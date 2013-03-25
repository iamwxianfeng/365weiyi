#coding:utf-8
module UsersHelper
  
  def roles
     [['受限用户', User::BLOCKED], ['普通', User::USER],['工作人员', User::EDITOR], ['管理员', User::ROOT],["量体师",User::RULER]]
  end
  
end