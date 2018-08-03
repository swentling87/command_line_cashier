# == Schema Information
#
# Table name: global_promos
#
#  id           :bigint(8)        not null, primary key
#  discount     :integer
#  min_purchase :integer
#

require_relative '../../models/global_promo'
require_relative '../../helpers/db_helper'

RSpec.describe GlobalPromo, type: :model do
  before(:each) do
    DbHelper.set_test_db
  end
  
  describe 'attributes' do
    it { should respond_to(:discount) }
    it { should respond_to(:min_purchase) }
  end
  
end
