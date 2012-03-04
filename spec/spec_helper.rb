def generate_install_and_migrate
  Dir.chdir(File.expand_path("../dummy", __FILE__))
  %x{bundle exec rails g manifest:install Page}
  %x{bundle exec rake db:migrate RAILS_ENV=development}
  %x{bundle exec rake db:test:prepare}
  Dir.chdir(File.expand_path("../..", __FILE__))
end

generate_install_and_migrate

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.after(:suite) do
    destroy_install_and_remove_db
  end
end

def destroy_install_and_remove_db
  Dir.chdir("#{Rails.root}")
  %x{bundle exec rails d manifest:install Page}
  FileUtils.rm_rf("#{Rails.root}/db")
end
