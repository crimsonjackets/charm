module Charm
  class ErrorPagesController < ApplicationController
    include PreviousLocation

    def unauthorized
      self.previous_location = request.fullpath
      render status: :unauthorized
    end

    def forbidden
      render status: :forbidden
    end

    def not_found
      render status: :not_found
    end
  end
end
