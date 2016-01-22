$: << File.expand_path('..', __FILE__)

require "all"

products = []
products << Product.new(name: 'FR1', price: 3.11)
products << Product.new(name: 'AP1', price: 5.00)
products << Product.new(name: 'CF1', price: 11.23)

pricing_rules = []
pricing_rules << GetOneForFree.new(product_name: 'FR1')
pricing_rules << BulkPurchase.new(product_name: 'AP1', bulk_limit: 3, price: 4.5)

puts "Available Products: "
puts products.map {|p| [p.name, p.price]}.inspect

checkout = Checkout.new(pricing_rules)

while true
  print 'Add a product to the basket (or give the word stop to checkout): '
  product_name = gets.chomp.strip
  puts "You gave: #{product_name}"
  break if product_name.downcase == 'stop'

  product = products.select {|p| p.name.downcase == product_name.downcase}.first
  puts("...hmmm! Not one of the existing products") and next if product.nil?

  checkout.scan(product)
end

puts "The final price is: #{checkout.total}"