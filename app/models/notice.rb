#coding:utf-8
class Notice < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, :within => 3..100, :message => '标题不要少于3个字符'
end
