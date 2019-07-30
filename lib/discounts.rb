# Class that contains items to be discounted
class Discounts

  attr_reader :discounts_hash

  # array contains items and discounts
  def initialize(hash)
    @discounts_hash = hash
  end

  def add_offer(offers)
    discounts_hash.merge!(offers)
  end

end

class Multiples_discounts < Discounts

  def add_multi(item, buy, free)
    offer = {item => [buy, free]}
    self.add_offer(offer)
  end

end

class Percentage_discounts < Discounts

  def add_perc(item, percentage)
    offer = {item => percentage/100.0 }
    self.add_offer(offer)
  end

end
