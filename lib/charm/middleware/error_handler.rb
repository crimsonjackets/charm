module Charm
  module Middleware
    class ErrorHandler
      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env)
      rescue StandardError => error
        error_page = Charm.config.error_pages[error.class.name]

        if error_page
          "#{error_page[:controller]}_controller".classify.constantize.action(error_page[:action]).call(env)
        else
          raise
        end
      end
    end
  end
end
