class BulkPurchase < PricingRule

  # This policy works as follows. When you buy more (including) items of
  # a product than the bulk limit, then each product item gets a discount
  #
  # @param bulk_purchases [BulkPurchase::BulkPurchaseItem]
  #
  def initialize(product_name:, bulk_limit:, price:)
    @product_name = product_name
    @bulk_limit   = bulk_limit
    @price        = price
  end

  # @param basket This is a Hash of BasketItems
  #               The key is the product_name
  #
  def apply(basket)
    basket.each do |product_name, basket_item|
      next unless product_name.downcase == @product_name.downcase && @bulk_limit <= basket_item.quantity
      basket_item.final_price = basket_item.quantity * @price
    end
  end
end