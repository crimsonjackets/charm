ENV['RAILS_ENV'] ||= 'test'
require_relative 'dummy/config/environment'

require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
