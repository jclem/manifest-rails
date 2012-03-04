Rails.application.routes.draw do
  namespace :manifest do
    resources :pages
    resources :content_blocks
  end

  get '/:slug' => 'pages#show', as: 'page'
end
