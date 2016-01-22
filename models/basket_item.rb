# This class is more like a Struct. And does not make too much sense on its own.
# It is use by the +basket+ Hash inside the +Checkout+ object, to hold
# the price related properties of a product in the basket.
#
#
class BasketItem
  attr_accessor :final_price, :original_price, :quantity

  def initialize(original_price:, quantity:, final_price:)
    @original_price = original_price # this is price per item
    @quantity       = quantity
    @final_price    = final_price # this is total price for product, after any discount that might be applied by pricing rule
  end
end