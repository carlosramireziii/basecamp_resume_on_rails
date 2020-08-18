Rails.application.routes.draw do
  resources :projects
  resource :sessions, only: [:new, :create, :destroy]
  resource :users, only: [:new, :create, :edit, :update]
  root to: 'projects#index'
end
