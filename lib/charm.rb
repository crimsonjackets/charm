module Charm
  module Middleware
    autoload :ErrorHandler, 'charm/middleware/error_handler'
    autoload :Router, 'charm/middleware/router'
  end
end

require 'charm/engine'
