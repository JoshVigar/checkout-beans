require_relative 'checkout_dynamic'
require_relative 'discounts'

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

list = Discounts.new({ "orange" => [2,1] })
list.add_offer({ "apple" => [2,1] })
puts list.discounts_hash

checkout.scan(:apple)
puts checkout.total(list.discounts_hash)
