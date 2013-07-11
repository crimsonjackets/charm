module Charm
  module PreviousLocation
    extend ActiveSupport::Concern
  private
    def previous_location
      session[:previous_location]
    end

    def previous_location= location
      session[:previous_location] = location
    end

    def redirect_to_previous_location default_location, options = {}
      redirect_to previous_location || default_location, options
      self.previous_location = nil
    end
  end
end
