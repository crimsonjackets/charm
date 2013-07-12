require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    config.time_zone = 'St. Petersburg'
    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru
  end
end
