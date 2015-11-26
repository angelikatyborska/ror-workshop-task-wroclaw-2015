Rails.application.routes.draw do
  devise_for :users

  root to: 'visitors#index'

  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  resources :payments

  get 'report/subjects', to: 'reports#subjects'
  get 'visitors', to: 'visitors#index'
end
