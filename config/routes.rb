Rails.application.routes.draw do
  
  devise_for :users, :controllers => {registrations: 'registrations'} 
  root to: 'events#index'
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  resources :events do
    resources :attendances, only: [:index, :new, :create]
    resources :event_pictures, only: [:create]
  end
  

 
end
