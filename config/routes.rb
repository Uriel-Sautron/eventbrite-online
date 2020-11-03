Rails.application.routes.draw do
  

  devise_for :users, :controllers => {registrations: 'registrations'}
  root to: 'events#index'
  resources :users, only: [:show]
  resources :events
end
