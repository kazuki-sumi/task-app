Rails.application.routes.draw do
  namespace :admin do
    resources :homes, only: [:index]
  end
end
