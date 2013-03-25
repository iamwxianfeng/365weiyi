#coding:utf-8
class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  validates_presence_of :name, :message => '回复内容不能为空'
  validates_length_of :name, :within => 3..250

end
