Rails.application.routes.draw do
  devise_for :users
  root to: 'records#index'
  resources :records 
  resources :targets, only: [:index, :new, :create, :show, :edit, :update]
end
