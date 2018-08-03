# == Schema Information
#
# Table name: item_promos
#
#  id       :bigint(8)        not null, primary key
#  item_id  :bigint(8)
#  discount :integer
#

class ItemPromo < ActiveRecord::Base
  belongs_to :item
end
