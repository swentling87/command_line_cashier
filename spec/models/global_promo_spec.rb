require_relative '../../models/global_promo'
require_relative '../../helpers/db_helper'

RSpec.describe GlobalPromo, type: :model do
  before(:each) do
    DbHelper.set_db
  end
  
  describe 'attributes' do
    it { should respond_to(:discount) }
  end
  
end
