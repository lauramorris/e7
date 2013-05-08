# config/routes.rb

Myfirstapp::Application.routes.draw do
  resources :users

  # these two lines are new
  match "/auth/google_login/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
    
  get "home/index"
  root :to => 'home#index'
end
