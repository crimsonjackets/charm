module Charm
  class ErrorHandler
    def initialize app
      @app = app
    end

    def call env
      @app.call env
    rescue StandardError => error
      controller, action = Charm.config.error_pages[error.class.name].try :split, '#'

      if controller && action
        "#{controller}_controller".classify.constantize.action(action).call(env)
      else
        raise
      end
    end
  end
end
