class Checkout_dynamic
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  def total(discounts)
    total = 0

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      key = item.to_s
      if discounts[key] != nil
        total += prices.fetch(item) * count * (discounts[key][1])/(discounts[key][0]).to_f
      else
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
