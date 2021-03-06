Rails.application.routes.draw do
  devise_for :users
  resources :clients, type: 'Client'
  resources :administrators, type: 'Administrator'
  resources :vehicles
  resources :maintenances

  post 'vehicles/search', to: 'vehicles#search'
  
	root 'vehicles#index'
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
