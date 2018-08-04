# == Schema Information
#
# Table name: items
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  cost       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'active_record'

class Item < ActiveRecord::Base
  has_many :item_promos, dependent: :destroy
  
  def to_s
    puts "   #{name} => £#{cost} SKU: #{id}\n"
  end
  
end
