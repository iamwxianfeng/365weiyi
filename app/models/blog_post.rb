#coding:utf-8
class BlogPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :category , :foreign_key=>'category_id'
  has_many :comments , :class_name=>"BlogComment"
  has_many :blog_tags
  
  validates :title , :presence=>{ message: "标题不能为空" }
  validates :content , :presence=>{ message: '内容不能为空' }
  validates :category_id , :presence=>{ message: '主题不能为空' }
  validates :product1_id , :presence=>{ message: "推荐商品1不能为空" } , :product_format=>{message: "商品不存在" }
  validates :product2_id , :presence=>{ message: "推荐商品2不能为空" } , :product_format=>{message: "商品不存在" }
  
  accepts_nested_attributes_for :blog_tags , :allow_destroy => :true, # 允许删除
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } } # tag为空的时候 不保存
  
  #  def to_param
  #    "#{id}-#{title.gsub(/[^\A[[:alnum:]][[:alnum:]\.\-_@]+\z]+/i,'-')}"
  #  end
  
  def self.per_page
    5
  end
  
  ##
  # 推荐的商品
  def products
    p1 = Product.find(product1_id)
    p2 = Product.find(product2_id)
    [p1,p2]
  end
  
end
