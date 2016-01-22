Given(/^The products:$/) do |table|
  @products = []
  table.hashes.each do |row|
    @products << Product.new(name: row['product'], price: row['price'].to_f)
  end
end

When(/^Checkout the product "([^"]*)"$/) do |product_name|
  scan_product product_name
end

And(/^Then the product "([^"]*)"$/) do |product_name|
  scan_product product_name
end

Then(/^Final price expected should be "([^"]*)"$/) do |final_price|
  final_price = final_price.to_f
  expect(final_price).to eq(@checkout.total)
end