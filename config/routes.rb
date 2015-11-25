Rails.application.routes.draw do
  devise_for :users

  resources :students do
    get :subjects
  end

  resources :teachers

  get 'reports/subjects', to: 'reports#subjects'
  get 'visitors', to: 'visitors#index'
end
