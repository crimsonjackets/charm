require 'slim'
require 'jquery-rails'
require 'turbolinks'

module Charm
  class Engine < ::Rails::Engine
    isolate_namespace Charm

    initializer 'charm.postgresql_monkey_patch' do |app|
      ActiveSupport.on_load :active_record do
        ActiveRecord::ConnectionAdapters::PostgreSQLAdapter::NATIVE_DATABASE_TYPES[:string].delete(:limit)
      end
    end

    initializer 'charm.error_handler_middleware' do |app|
      app.middleware.use 'Charm::Middleware::ErrorHandler'
    end
  end
end
