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

end
