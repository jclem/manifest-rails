Rails.application.routes.draw do
  namespace :manifest do
    resources :pages
  end
end
