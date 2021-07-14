Rails.application.routes.draw do
  devise_for :users
  root to: 'records#index'
  resources :records,only: [:index, :create, :edit, :update, :destroy] 
  resources :users, only: :show 
  resources :targets, only: [:show, :new, :create, :edit, :update]
  resources :messages, only: :create
end
