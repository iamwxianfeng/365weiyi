#coding:utf-8
class Inquiry < ActiveRecord::Base
  belongs_to :user

  attr_accessible :description
end
