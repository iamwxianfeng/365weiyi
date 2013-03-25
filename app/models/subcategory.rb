#coding:utf-8
class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :products, :order => "our_price ASC, popularity DESC"

  validates_presence_of :name
end
