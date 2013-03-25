#coding:utf-8
class CustomizationWrap
  attr_reader :product
  attr_reader :customizations

  def initialize(product)
    @product = (product || Product.find(:first))
    @customizations = []
  end

  def add_customization(customization_category, customization_value)
    return false unless (customization_category and customization_value)

    @customizations << {:customization_category => customization_category,
      :customization_value => customization_value}
    @customizations.uniq!
  end

end
