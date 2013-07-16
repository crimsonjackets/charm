Charm::Engine.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :pages, only: %w[index new create]
  resources :meta_tags, only: %w[create update destroy]
  resources :titles, only: %w[create update destroy]
  get 'pages/:id/edit', to: 'pages#edit'
  get 'pages/:id', to: 'pages#show'
  %w[patch put].each { |method| send method, 'pages/:id', to: 'pages#update' }
  delete 'pages/:id', to: 'pages#destroy'
  resource :page, except: %w[index new create], path: '(*path)', defaults: { path: '' }

  root to: 'pages#show'
end
