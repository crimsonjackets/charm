Charm::Engine.routes.draw do
  resources :pages, only: %w[index new create]
  resource :page, except: %w[index new create], path: '(*path)', defaults: { path: '' }
end
