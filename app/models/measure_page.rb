#coding:utf-8
class MeasurePage < ActiveRecord::Base
  has_many :measure_properties
  has_many :measurements

  validates_presence_of :name, :message => '名称不能为空'
end
