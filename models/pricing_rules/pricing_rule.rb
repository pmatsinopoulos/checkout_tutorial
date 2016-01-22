class PricingRule
  # @param basket Basket
  #
  def apply(basket)
    raise NotImplementedError.new('You need to specify the actual implementation in on of the concrete classes')
  end
end