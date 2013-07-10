module Charm
  module Middleware
    class ErrorHandler
      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env)
      rescue StandardError => error
        raise
      end
    end
  end
end
