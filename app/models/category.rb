#coding:utf-8
class Category < ActiveRecord::Base
  has_many :subcategories, :order => "popularity DESC"
  has_many :products, :through => :subcategories

  validates_presence_of :name, :message => '分类名不能为空'
  validates_presence_of :url, :message => '分类URL不能为空'

  attr_accessor :image
end
