Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'welcome/index'
  root 'users#show'

end
