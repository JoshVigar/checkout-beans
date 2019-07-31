# Checkout_dynamic is a refactored version of Checkout. The main change is to
# the total method, adding optional parameters for multibuy and percentage
# discounts. The method code has also been modified to remove as much repeated
# code as possible and to support dynamically defined discount offers.
class Checkout_dynamic
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  # parameters are defined with the empty hash as the default value
  def total(multi={}, perc={})
    total = 0

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      # if the item has a multibuy discount then apply the discount
      if multi[item] != nil && (count % multi[item][0] == 0)
        #this multiplier is used to apply a percentage discount to a multibuy
        # discount if both are valid
        multiplier = 1
        if perc[item] != nil
          multiplier = perc[item]
        end
        # For a multibuy discount the total is the price of the items multiplied by the (items paid for/total items)
        total += prices.fetch(item) * count * (multi[item][1])/(multi[item][0]).to_f * multiplier
      elsif perc[item] != nil
        # for a percentage discount the total is the price of the item multiplied by the percentage discount/100
        total += prices.fetch(item)* perc[item] * count
      else
        # if no discounts are valid, total is simply the item multiplied by the price
        total += prices.fetch(item) * count
      end
    end
    total
  end

  private

  def basket
    @basket ||= Array.new
  end
end
