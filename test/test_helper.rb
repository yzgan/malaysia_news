ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'database_cleaner'
require 'capybara/rails'
require 'capybara/minitest'
require 'webdrivers'

Webdrivers::Chromedriver.required_version = '2.38.552518'

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  # Make `assert_*` methods behave like Minitest assertions
  include Capybara::Minitest::Assertions

  # Reset sessions and driver between tests
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

DatabaseCleaner.strategy = :transaction

# with the minitest-around gem, this may be used instead:
class Minitest::Spec
  around do |tests|
    DatabaseCleaner.cleaning(&tests)
  end
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
