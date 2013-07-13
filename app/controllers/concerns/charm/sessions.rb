module Charm
  module Sessions
    extend ActiveSupport::Concern

    included do
      helper_method :current_user, :signed_in?, :signed_in_as_admin?
    end
  private
    def current_user
      @current_user ||= Account.find_by_id(session[:current_user_id])
    end

    def current_user= user
      @current_user = user
      session[:current_user_id] = user.try :id
    end

    def signed_in?
      current_user.kind_of? Account
    end

    def ensure_signed_in
      raise Unauthorized unless signed_in?
    end

    def signed_in_as_admin?
      current_user.kind_of? Admin
    end

    def ensure_signed_in_as_admin
      ensure_signed_in
      raise Forbidden unless signed_in_as_admin?
    end
  end
end
