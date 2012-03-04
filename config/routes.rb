Rails.application.routes.draw do
  namespace :manifest do
    resources :pages
  end

  get '/:slug' => 'pages#show', as: 'page'
end
