module Charm
  class ErrorPagesController < ApplicationController
    include PreviousLocation

    before_action -> {
      self.previous_location = request.fullpath
      @errors = []
    }, only: %w[unauthorized forbidden]

    def unauthorized
      respond_to do |format|
        format.html { render 'charm/sessions/new', status: :unauthorized }
        format.json { render json: 'unauthorized' }
      end
    end

    def forbidden
      respond_to do |format|
        format.html { render 'charm/sessions/new', status: :forbidden }
        format.html { render json: 'forbidden' }
      end
    end

    def not_found
      render status: :not_found
    end
  end
end
