# == Schema Information
#
# Table name: global_promos
#
#  id           :bigint(8)        not null, primary key
#  discount     :integer
#  min_purchase :integer
#

require 'active_record'

class GlobalPromo < ActiveRecord::Base

  def to_s
    puts "   Minimum Purchase:#{min_purchase} => £#{discount} ID: #{id}\n"
  end
  
end
