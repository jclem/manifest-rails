# Load the rails application
require File.expand_path('../application', __FILE__)

def connect_to_database
  config = YAML::load(IO.read("#{Rails.root}/config/database.yml"))
  ActiveRecord::Base.establish_connection(config['test'])
  load "#{Rails.root}/db/schema.rb"
end

# Initialize the rails application
Dummy::Application.initialize!

if Rails.env == 'test'
  connect_to_database
end

