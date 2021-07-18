Rails.application.routes.draw do
  root to: 'users#show'
  devise_for :users
  get "users/:id" => "users#show", as: :mypage
    namespace :admin do
      resources :users, only: [:index, :show, :destroy]
      resources :rooms, only: :create do 
        resources :messages, only: [:index, :create]
      end
    end
  resources :records,only: [:index, :create, :edit, :update, :destroy] 
  resources :targets, only: [:show, :new, :create, :edit, :update]
  resources :messages, only: :create
  resources :reservations, only: [:create, :destroy]
end
