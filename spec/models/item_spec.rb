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
  
end
