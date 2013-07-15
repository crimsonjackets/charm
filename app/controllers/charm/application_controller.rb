module Charm
  class ApplicationController < ActionController::Base
    include Sessions
    include CustomTemplates

    protect_from_forgery with: :exception
  end
end
