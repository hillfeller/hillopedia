Rails.application.routes.draw do
  get 'collaborators/index'

  resources :wikis do
    resources :collaborators, only: [:index, :create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show]

  get 'welcome/index'
  root 'users#show'
  resources :charges, only: [:new, :create, :update]
  get "charges/downgrade"

end
