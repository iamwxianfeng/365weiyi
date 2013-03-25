#coding:utf-8
class Feedback < ActiveRecord::Base
  validates_presence_of :name, :message => '发表留言前必须输入您的昵称'
  validates_presence_of :description,
    :message => '留言内容不能为空'
  validates_length_of :description, :maximum => 150,
    :message => '留言内容不要太长'
end
