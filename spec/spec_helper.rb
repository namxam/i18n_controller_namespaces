ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..'

# Load the Rails environment and testing framework
require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb'))
require 'rspec/rails'


# Configure rspec environment
RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
end