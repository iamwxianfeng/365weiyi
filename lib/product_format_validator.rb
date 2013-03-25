#coding:utf-8
class ProductFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    if value and Product.exists?(:id=>value) == false
      object.errors[attribute] << (options[:message] || "商品不存在")
    end
  end
end