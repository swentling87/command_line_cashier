require 'active_record'

module DbHelper

  def DbHelper.db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
  end
  
  def DbHelper.set_db
    ActiveRecord::Base.establish_connection(DbHelper.db_configuration["development"])
  end
  
end