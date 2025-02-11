Rails.application.routes.draw do
  # Authentication routes
  root 'books#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'profile', to: 'users#show', as: 'profile'

  # Application routes
  resources :books, only: [:index, :show]
  resources :borrowings, only: [:create] do
    post 'return', on: :member
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
