require_relative '../helpers/db_helper'
require_relative 'item'
require_relative 'item_promo'
require_relative 'global_promo'

class Basket
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_item(sku)
    @items << Item.find(sku)
  end
  
  def view
    @items
  end
  
  def total
    total = @items.pluck(:cost).sum
    
    #Apply Item Promos
    item_id_array = @items.pluck(:id)
    item_counts = item_id_array.uniq.map{ |x| {item_id: x, count: item_id_array.count(x)} }
    item_counts.each do |item|
      item_promos = ItemPromo.where("item_id = ? AND min_quantity >= ?", item[:item_id], item[:count]).pluck(:discount).sum
      total -= item_promos if item_promos
    end
      
    #Apply Global Promos after item discounts
    global_promos = GlobalPromo.where("min_purchase <= ?", total).pluck(:discount).sum
    total -= global_promos if global_promos
  end
  
end
