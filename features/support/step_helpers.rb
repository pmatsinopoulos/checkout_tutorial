def scan_product(product_name)
  product = @products.select {|p| p.name.downcase == product_name.downcase}.first
  raise StandardError.new("Product: #{product_name} not found!") if product.nil?

  @checkout = Checkout.new(@pricing_rules) if @checkout.nil?
  @checkout.scan(product)
end

def add_pricing_rule(pricing_rule)
  @pricing_rules = [] if @pricing_rules.nil?
  @pricing_rules << pricing_rule
end