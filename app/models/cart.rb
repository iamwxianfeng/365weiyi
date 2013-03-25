#coding:utf-8
class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product, measure, quantity)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increase_quantity(quantity)
    else
      @items << CartItem.new(product, measure, quantity)
    end
  end

  def delete(product_id)
    item_to_delete = self.items.find {
      |i| i.product.id == product_id}
    self.items.delete(item_to_delete)
  end

  def price
    @items.sum {|i| i.price}
  end

  def quantity
    @items.sum {|i| i.quantity}
  end

end
