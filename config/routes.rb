Rails.application.routes.draw do
  devise_for :users
  root to: 'targets#index'
  resources :targets do
    resources :budgets, only: [:new, :create, :edit, :update]
    resources :shoppings, only: [:create, :update]
    resources :messages, only: :create
  end
end
