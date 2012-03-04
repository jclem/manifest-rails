Rails.application.routes.draw do
  get '/manifest' => 'manifest/pages#index', as: 'manifest'

  namespace :manifest do
    resources :pages
    resources :content_blocks
  end

  get '/:id' => 'pages#show', as: 'page'
end
