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

class Item < ActiveRecord::Base
  has_many :item_promos
  
  def to_s
    puts "Name: #{name} => £#{price}"
  end
  
end
