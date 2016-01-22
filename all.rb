$: << File.join(File.expand_path('..', __FILE__), 'models')
$: << File.join(File.expand_path('..', __FILE__), 'models', 'pricing_rules')

require 'product'
require 'pricing_rule'
require 'get_one_for_free'
require 'bulk_purchase'
require 'basket_item'
require 'checkout'