module Charm
  class ErrorPagesController < ApplicationController
    include PreviousLocation

    before_action -> {
      self.previous_location = request.fullpath
      @errors = []
    }, only: %w[unauthorized forbidden]

    def unauthorized
      render 'charm/sessions/new', status: :unauthorized
    end

    def forbidden
      render 'charm/sessions/new', status: :forbidden
    end

    def not_found
      render status: :not_found
    end
  end
end
