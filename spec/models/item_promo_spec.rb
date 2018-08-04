# == Schema Information
#
# Table name: item_promos
#
#  id           :bigint(8)        not null, primary key
#  item_id      :bigint(8)
#  discount     :integer
#  min_quantity :integer
#

require_relative '../../models/item'
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
  
  describe '#to_s' do
    it "should return a string to display the global promo data" do
      item = Item.create(name: "Tea", cost: 100)
      ip = ItemPromo.create(item_id: item.id, min_quantity: 2, discount: 5)
      expect(STDOUT).to receive(:puts).with("   Item SKU: #{item.id}, Minimum Quantity: 2 => £5, ID: #{ip.id}\n")
      ip.to_s
    end
  end
  
end
