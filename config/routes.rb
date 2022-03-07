Rails.application.routes.draw do
  devise_for :users
  root to: 'targets#edit'
  resources :targets, only: [:edit, :new, :create, :index] do
    resources :budgets, only: [:new, :create]
  end
end
