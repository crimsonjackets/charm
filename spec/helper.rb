ENV['RAILS_ENV'] ||= 'test'

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

require_relative 'dummy/config/environment'

require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'
require 'capybara/rails'
require 'ffaker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
end

Dir[File.expand_path('../matchers/**/*.rb', __FILE__)].each { |file| require file }
