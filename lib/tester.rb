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

multi = Multiples_discounts.new({ :orange => [2,1] })
multi.add_multi(:apple, 2, 1)
puts multi.discounts_hash

perc = Percentage_discounts.new({ :banana => 0.5 })
perc.add_perc(:pear, 50)
puts perc.discounts_hash

2.times{checkout.scan(:apple)}
2.times{checkout.scan(:banana)}
puts checkout.total(multi.discounts_hash, perc.discounts_hash)
