Rails.application.routes.draw do
  devise_for :users
  root to: 'targets#new'
  resources :targets, only: [:edit, :new, :create, :index, :destroy, :update] do
    resources :budgets, only: [:new, :create]
  end
end
