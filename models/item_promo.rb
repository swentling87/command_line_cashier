# == Schema Information
#
# Table name: item_promos
#
#  id           :bigint(8)        not null, primary key
#  item_id      :bigint(8)
#  discount     :integer
#  min_quantity :integer
#

require 'active_record'

class ItemPromo < ActiveRecord::Base
  belongs_to :item
  
  def to_s
    puts "   Item SKU: #{item_id}, Minimum Quantity: #{min_quantity} => £#{discount}, ID: #{id}\n"
  end
end
