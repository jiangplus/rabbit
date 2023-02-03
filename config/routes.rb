Rails.application.routes.draw do

  root "api/profiles#index"

  namespace :api do
    resources :profiles
    resources :items
  end
end
