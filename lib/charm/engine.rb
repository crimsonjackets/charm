require 'slim'
require 'jquery-rails'
require 'turbolinks'

module Charm
  class Engine < ::Rails::Engine
    isolate_namespace Charm
  end
end
