require 'active_record'
require_relative '../models/item'
require_relative '../models/global_promo'
require_relative '../models/item_promo'
require_relative '../helpers/db_helper'

DbHelper.set_db
puts 'Items Created:'
puts a = Item.create(name: "A", cost: 30)
puts b = Item.create(name: "B", cost: 20)
puts c = Item.create(name: "C", cost: 50)
puts d = Item.create(name: "D", cost: 15)

puts 'Global Promos Created:'
puts GlobalPromo.create(min_purchase: 150, discount: 20)

puts 'Item Promos Created:'
puts ItemPromo.create(item_id: a.id, min_quantity: 3, discount: 15)
puts ItemPromo.create(item_id: b.id, min_quantity: 2, discount: 5)
