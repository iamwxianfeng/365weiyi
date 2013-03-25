#coding:utf-8
class Company < ActiveRecord::Base
  has_many :users

  validates_presence_of :name, :message => '公司名不可为空'
  validates_length_of :name, :maximum => 200
end
