Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "movies#index"

  resources :movies do 
  	member do
  		get "shows"
  	end
  end

  resources :bookings
  
  resources :shows do
  	member do
  		get "show_seats"
  	end
  end

  namespace :admin do
  	get "/dashboard", to: "dashboard#bookings"
  end

end
