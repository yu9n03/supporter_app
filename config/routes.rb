Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :records,only: [:create, :edit, :update, :destroy] 
  resources :users, only:[:show] do
    resources :rooms, only: :index
  end
  resources :targets, only: [:new, :create, :show, :edit, :update]
  resources :messages, only: :create
end
