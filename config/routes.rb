Rails.application.routes.draw do
  namespace :admin do
    resources :homes, only: [:index]
    resources :articles
    resources :article_files
  end
end
