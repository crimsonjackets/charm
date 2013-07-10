ENV['RAILS_ENV'] ||= 'test'
require_relative 'dummy/config/environment'

require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'
require 'ffaker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
end
