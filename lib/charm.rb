module Charm
  autoload :Configuration, 'charm/configuration'

  module Middleware
    autoload :ErrorHandler, 'charm/middleware/error_handler'
    autoload :Router, 'charm/middleware/router'
  end

  def self.config
    Configuration.instance
  end

  def self.configure
    yield config
  end
end

require 'charm/engine'
