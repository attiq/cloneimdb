Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      passwords: "users/passwords"
  }

  devise_scope :user do
    get "signup", to: "users/registrations#new", as: :signup
    get "signin", to: "users/sessions#new", as: :signin
    get "signout", to: "users/sessions#destroy", as: :signout
  end

  resources :movies

  get '/search', to: 'home#search'

  root "home#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
