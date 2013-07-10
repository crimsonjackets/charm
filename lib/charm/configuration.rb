module Charm
  class Configuration
    include Singleton

    @@defaults = {
      error_pages: {
        'Charm::Unauthorized' => { controller: 'charm/error_pages', action: :unauthorized },
        'OAuth::Unauthorized' => { controller: 'charm/error_pages', action: :unauthorized },
        'Charm::Forbidden' => { controller: 'charm/error_pages', action: :forbidden },
        'Charm::NotFound' => { controller: 'charm/error_pages', action: :not_found },
        'ActiveRecord::RecordNotFound' => { controller: 'charm/error_pages', action: :not_found }
      }
    }

    def self.defaults
      @@defaults
    end

    def initialize
      @@defaults.each { |k, v| self.send "#{k}=", v }
    end

    attr_accessor :error_pages
  end
end
