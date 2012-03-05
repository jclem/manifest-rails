Rails.application.routes.draw do
  get '/manifest' => 'manifest/pages#index', as: 'manifest'

  namespace :manifest do
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

    resources :sessions
    resources :pages
    resources :content_blocks
  end

  get '/:id' => 'pages#show', as: 'page'
end
