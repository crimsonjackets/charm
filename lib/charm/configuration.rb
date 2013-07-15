module Charm
  class Configuration
    include Singleton

    @@defaults = {
      error_pages: {
        'Charm::Unauthorized' => 'charm/error_pages#unauthorized',
        'OAuth::Unauthorized' => 'charm/error_pages#unauthorized',
        'Charm::Forbidden' => 'charm/error_pages#forbidden',
        'Charm::NotFound' => 'charm/error_pages#not_found',
        'ActiveRecord::RecordNotFound' => 'charm/error_pages#not_found'
      },

      templates: []
    }

    mattr_reader :defaults

    def initialize
      @@defaults.each { |k, v| self.send "#{k}=", v }
    end

    attr_accessor :error_pages, :templates
  end
end
