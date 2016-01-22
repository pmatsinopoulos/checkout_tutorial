class GetOneForFree < PricingRule
  # This pricing policy has the following logic. For each 1 product that
  # you get, you get 1 for free.
  #
  # @param product_name [String] The name of the product to get for free if you buy 1
  #
  def initialize(product_name:)
    @product_name = product_name
  end

  # @param basket Hash. Groups BasketItems by product
  # Based on the quantity of each product we will calculate the final price of each item.
  # The rule here is that if you buy one, you get one for free
  #
  def apply(basket)
    basket.each do |product_name, basket_item|
      next unless product_name.downcase == @product_name.downcase
      basket_item.final_price = basket_item.original_price * (basket_item.quantity / 2.0).round
    end
  end
end