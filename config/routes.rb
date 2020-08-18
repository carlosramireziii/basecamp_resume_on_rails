Rails.application.routes.draw do
  resources :projects do
    resources :messages
    resources :todo_lists
    resources :uploaded_files, except: [:edit, :update]
  end
  resource :sessions, only: [:new, :create, :destroy]
  resource :users, only: [:new, :create, :edit, :update]
  root to: 'projects#index'
end
