Rails.application.routes.draw do
  devise_for :users
  root to: 'records#index'
  resources :records,only: [:index, :create, :edit, :update, :destroy] 
  resources :users, only: :show 
  resources :targets, only: [:new, :create, :edit, :update]
end
