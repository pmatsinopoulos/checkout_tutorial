class Checkout

  attr_reader :basket, :pricing_rules

  # @param pricing_rules [PricingRule] An Array of Pricing Rules that are to be applied in order to
  #                                    calculate the final price.
  #
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @basket = {}
  end

  # @param product Product
  #
  #        When we add an item to the basket, we put it in the group of items for the same product.
  #        Also, at the same time, we increase the quantity by one and we calculate the final price for the quantity
  #        at the moment of the addition.
  #        Note: This final price might be changed at the final total calculation of the checkout, if
  #        there is any pricing rule that will apply. If there is not, then final price will be ready
  #        to be summed up to give the total price on the checkout.
  #
  def scan(product)
    @basket[product.name] = BasketItem.new(original_price: product.price, quantity: 0, final_price: 0) if @basket[product.name].nil?
    @basket[product.name].quantity += 1
    @basket[product.name].final_price = @basket[product.name].quantity * product.price
  end

  # Applies the pricing rules to the contents of the basket.
  # Then basket items hold their final price and we only have to sum them up.
  #
  def total
    pricing_rules.each {|pr| pr.apply(@basket) }

    @basket.reduce(0.0) do |result, (product_name, basket_item)|
      result + basket_item.final_price
    end
  end
end