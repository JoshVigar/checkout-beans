# Class that contains items to be discounted
class Discounts

  # need an attr_reader for the discounts_hash so a get method is available
  # outside the class
  attr_reader :discounts_hash

  # discounts_hash contains items and their associated discounts
  def initialize(hash)
    @discounts_hash = hash
  end

  # add_offer is used to merge an offer into the discounts_hash
  def add_offer(offers)
    discounts_hash.merge!(offers)
  end

end

# subclass of Multiples_discounts inherits the basic attribute and methods from
# Discounts but also can build a hash from a set of parameters describing a
# multibuy offer
class Multiples_discounts < Discounts

  # add_multi uses the item, the amount necessary to apply the offer, and number
  # of free items eg. Buy 2 get one free on pears = add_multi(:pear, 2, 1)
  # The restrict parameter is used to define the maximum amount of times the
  # offer can be used per customer, it is optional, default of 0 (unlimited)
  def add_multi(item, buy, free, restrict=0)
    offer = {item => [(buy+1), (buy-free+1), restrict]}
    # add the offer to the multples discount hash
    self.add_offer(offer)
  end

end

# similar to Multiples_discounts, Percentage_discounts is a subclass of
# Discounts and can build a hash from a set of parameters for a percentage
# discount
class Percentage_discounts < Discounts

  # add_perc uses the item and a percentage discount desired
  # eg. 50% off on mangos = add_perc(:mango, 50)
  def add_perc(item, percentage)
    offer = {item => percentage/100.0 }
    # add the offer to the percentage discount hash
    self.add_offer(offer)
  end

end
