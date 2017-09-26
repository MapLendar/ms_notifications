Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :notifications, only: [:index, :create, :destroy, :post]
  get "notifications/by_email", to: 'notifications#by_email'
  post "/new", to: "notifications#create"
end
