require_relative '../helpers/db_helper'
require_relative 'item'

class Basket
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_item(sku)
    @items << Item.find(sku)
  end

  def remove_entry
  end
  
  def view
    @items
  end
  
  def total
    @items.pluck(:cost).sum
  end
  
  def checkout
  end
  
end
