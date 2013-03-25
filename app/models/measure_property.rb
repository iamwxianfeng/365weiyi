#coding:utf-8
class MeasureProperty < ActiveRecord::Base
  belongs_to :measure_page
  has_many :measurements
end
