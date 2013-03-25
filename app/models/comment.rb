#coding:utf-8
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :replies, :order => "created_at ASC"
  
  validates :name , :presence=> { message: '评论内容不能为空' }
  validates_length_of :name, :within => 3..250  
  validates :product_id , :presence=>{ message: '请对具体的商品进行评论'}
  
  attr_protected :popularity, :approved
end
