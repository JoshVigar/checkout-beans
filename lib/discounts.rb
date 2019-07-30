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

# class Multiples_discounts < Discounts
#
#   def initialize(hash)
#
#   end
#
# end
#
# class Percentage_discounts < Discounts
#
#   def initialize(hash)
#
#   end
#
# end
