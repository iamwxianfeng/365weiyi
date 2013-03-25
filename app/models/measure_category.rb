#coding:utf-8
class MeasureCategory < ActiveRecord::Base
  has_many :measure_pages
end
