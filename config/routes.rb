Rails.application.routes.draw do
  resources :productts
  resources :products
  resources :tasks
  root to: "tasks#index"
end
