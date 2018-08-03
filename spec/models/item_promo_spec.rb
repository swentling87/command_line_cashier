# == Schema Information
#
# Table name: item_promos
#
#  id       :bigint(8)        not null, primary key
#  item_id  :bigint(8)
#  discount :integer
#

require_relative '../../models/item_promo'
require_relative '../../helpers/db_helper'

RSpec.describe ItemPromo, type: :model do
  before(:each) do
    DbHelper.set_test_db
  end
  
  describe 'attributes' do
    it { should respond_to(:item) }
    it { should respond_to(:discount) }
  end
  
end
