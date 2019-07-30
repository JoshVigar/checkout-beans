class Checkout_dynamic
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  def total
    total = 0
    discounts = { "apple" => [2,1] }

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      key = item.to_s
      if discounts[key] != nil
        total += prices.fetch(item) * count * (discounts[key][1])/(discounts[key][0]).to_f
      end
    end
    total
  end

  private

  def basket
    @basket ||= Array.new
  end
end

if __FILE__ == $0
  pricing_rules =
        {
          apple: 10,
          orange: 20,
          pear: 15,
          banana: 30,
          pineapple: 100,
          mango: 200
        }
  checkout = Checkout_dynamic.new(pricing_rules)
  checkout.scan(:apple)
  puts checkout.total
end
