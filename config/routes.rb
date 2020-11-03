Rails.application.routes.draw do
  
  root to: 'event#index'
  
  resources :events
end
