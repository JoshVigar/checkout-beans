class Checkout_dynamic
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket << item.to_sym
  end

  def total(multi, perc)
    total = 0

    basket.inject(Hash.new(0)) { |items, item| items[item] += 1; items }.each do |item, count|
      if multi[item] != nil
        if (count % multi[item][0] == 0)
          total += prices.fetch(item) * count * (multi[item][1])/(multi[item][0]).to_f
        else
          total += prices.fetch(item) * count
        end
      elsif perc[item] != nil
        total += prices.fetch(item)* perc[item] * count
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
