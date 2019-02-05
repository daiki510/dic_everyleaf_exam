Rails.application.routes.draw do
  
  get 'sessions/new'
  root to: 'tasks#index'
  
  resources :users, only: [:new, :create, :show]

  resources :tasks

end
