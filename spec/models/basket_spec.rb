require_relative '../spec_helper'
require_relative '../../models/basket'
require_relative '../../helpers/db_helper'

RSpec.describe Basket, type: :model do
  before(:each) do
    DbHelper.set_test_db
  end
  let(:item) { Item.create(name: 'item_1', cost: 2) }
  
  describe 'attributes' do
    it { should respond_to(:items) }
    
    it 'should start with an empty array of items' do
      expect(Basket.new.items.empty?).to eq(true)
    end
  end
  
  describe '#add_item' do
    it 'should add a new item to the basket' do
      basket = Basket.new
      expect(basket.items.empty?).to eq(true)
      basket.add_item(item.id)
      expect(basket.items.empty?).to eq(false)
      expect(basket.items.first).to eq(item)
    end
  end
  
  describe '#view' do
    it 'should return all the items' do
      basket = Basket.new
      basket.add_item(item.id)
      expect(basket.view).to eq([item])
    end
  end
  
  describe '#total' do
    it 'should return the total adjusted by no promos' do
      basket = Basket.new
      basket.add_item(item.id)
      expect(basket.total).to eq(2)
    end
    
    it 'should return the total adjusted by a global promos' do
      basket = Basket.new
      basket.add_item(item.id)
      expect(basket.total).to eq(2)
    end
  end
  
end
