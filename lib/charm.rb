module Charm
  autoload :Configuration, 'charm/configuration'

  autoload :Error, 'charm/errors/error'
  autoload :Unauthorized, 'charm/errors/unauthorized'
  autoload :Forbidden, 'charm/errors/forbidden'
  autoload :NotFound, 'charm/errors/not_found'

  autoload :ErrorHandler, 'charm/error_handler'

  module Validators
    autoload :TypeValidator, 'charm/validators/type_validator'
    autoload :URI, 'charm/validators/uri'
  end

  autoload :UrlHelpers, 'charm/url_helpers'

  def self.config
    Configuration.instance
  end

  def self.configure
    yield config
  end
end

require 'charm/engine'
