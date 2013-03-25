#coding:utf-8
class Event < ActiveRecord::Base
  belongs_to :user
end
