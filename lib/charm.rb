module Charm
  autoload :Configuration, 'charm/configuration'

  autoload :Error, 'charm/errors/error'
  autoload :Unauthorized, 'charm/errors/unauthorized'
  autoload :Forbidden, 'charm/errors/forbidden'
  autoload :NotFound, 'charm/errors/not_found'

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
