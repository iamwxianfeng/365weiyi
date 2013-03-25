#coding:utf-8
class Chat < ActiveRecord::Base

  def human_viewed
    viewed ? "是" : '<span style="color:red;">否</span>'
  end

end
