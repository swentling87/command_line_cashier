require_relative '../../models/item'
require_relative '../../helpers/db_helper'

RSpec.describe Item, type: :model do
  before(:each) do
    DbHelper.set_db
  end
  
  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:cost) }
  end
  
end
