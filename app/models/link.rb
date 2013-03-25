#coding:utf-8
class Link < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :name, :message => '网站名称不能为空'
  validates_presence_of :url, :message => '网站URL不能为空'

  attr_accessible :name, :description, :url, :logo
end
