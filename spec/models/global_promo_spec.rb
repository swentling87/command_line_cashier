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
  
  describe '#to_s' do
    it "should return a string to display the global promo data" do
      gp = GlobalPromo.create(discount: 10, min_purchase: 100)
      expect(STDOUT).to receive(:puts).with("   Minimum Purchase: 100 => £10 ID: #{gp.id}\n")
      gp.to_s
    end
  end
  
end
