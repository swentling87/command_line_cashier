require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DbHelper.set_test_db
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
end