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

require_relative '../../models/item'
require_relative '../../helpers/db_helper'

RSpec.describe Item, type: :model do
  before(:each) do
    DbHelper.set_test_db
  end
  
  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:cost) }
  end
  
  describe '#to_s' do
    it "should return a string to display the global promo data" do
      item = Item.create(name: "Tea", cost: 100)
      expect(STDOUT).to receive(:puts).with("   Tea => £100 SKU: #{item.id}\n")
      item.to_s
    end
  end
  
end
