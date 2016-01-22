And(/^The buy one get one for free rules:$/) do |table|
  table.hashes.each do |row|
    add_pricing_rule GetOneForFree.new(product_name: row['product'])
  end
end

And(/^The bulk purchase rules:$/) do |table|
  table.hashes.each do |row|
    add_pricing_rule BulkPurchase.new(product_name: row['product'],
                                      bulk_limit:   row['bulk_limit'].to_i,
                                      price:        row['price'].to_f)
  end
end
