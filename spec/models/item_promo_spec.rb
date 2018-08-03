require_relative '../../models/item_promo'
require_relative '../../helpers/db_helper'

RSpec.describe ItemPromo, type: :model do
  before(:each) do
    DbHelper.set_db
  end
  
  describe 'attributes' do
    it { should respond_to(:item) }
    it { should respond_to(:discount) }
  end
  
end
