require 'russian'
require 'slim'
require 'jquery-rails'
require 'turbolinks'

module Charm
  class Engine < ::Rails::Engine
    isolate_namespace Charm

    initializer 'charm.active_record_configuration' do |app|
      ActiveSupport.on_load :active_record do
        ActiveRecord::ConnectionAdapters::PostgreSQLAdapter::NATIVE_DATABASE_TYPES[:string].delete(:limit)
      end
    end

    initializer 'charm.action_view_configuration' do |app|
      # TODO fix that
      app.config.action_view.field_error_proc = ->(html_tag, _) { html_tag }
    end

    initializer 'charm.url_helpers' do |app|
      ActionDispatch::Routing::RouteSet::NamedRouteCollection.send :include, UrlHelpers
    end

    initializer 'charm.error_handler' do |app|
      app.middleware.use 'Charm::ErrorHandler'
    end
  end
end
