module Charm
  module Middleware
    class Router
      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env)
      end
    end
  end
end
