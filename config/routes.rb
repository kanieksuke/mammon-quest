Rails.application.routes.draw do
  root to: 'targets#index'
  resources :targets, only: [:index]
end
