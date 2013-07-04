require 'charm/routing/constraints'

Charm::Engine.routes.draw do
  scope '(:locale)', constraints: Charm::Routing::Constraints::Locale do
  end
end
