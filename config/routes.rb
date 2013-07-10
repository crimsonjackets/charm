Charm::Engine.routes.draw do
  resources :pages, only: %w[index new create]
  get 'pages/:id', to: 'pages#show'
  get 'pages/:id/edit', to: 'pages#edit'
  patch 'pages/:id', to: 'pages#update'
  put 'pages/:id', to: 'pages#update'
  delete 'pages/:id', to: 'pages#destroy'
  resource :page, except: %w[index new create], path: '(*path)', defaults: { path: '' }
end
