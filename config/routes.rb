Rails.application.routes.draw do
  root to: 'targets#index'
  resources :targets, only: [:index, :new, :create] do
    resources :budgets, only: [:new]
  end
end
