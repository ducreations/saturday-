Rails.application.routes.draw do
  devise_for :users

  resources :friends, except: [:edit]
  root to: 'friends#index'
end
