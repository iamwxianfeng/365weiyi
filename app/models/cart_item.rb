#coding:utf-8
class CartItem

  attr_reader :product
  attr_accessor :quantity, :measure
  
  def initialize(product, measure, quantity)
    @product = product
    quantity = quantity.to_i
    if quantity <= 1
      @quantity = 1
    else
      @quantity = quantity
    end
    @measure = measure
  end
  
  def increase_quantity(quantity)
    @quantity += (quantity.to_i)
  end
  
  def name
    @product.name
  end

  def price
    @product.our_price * @quantity
  end
end
