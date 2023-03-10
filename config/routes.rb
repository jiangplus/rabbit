Rails.application.routes.draw do

  root "api/profiles#index"

  namespace :api do
    resources :profiles
    resources :items
    post 'login' => 'profiles#login'
    post 'claim' => 'items#update'
  end
end

