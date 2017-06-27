Rails.application.routes.draw do
  resources :replies, only: :new
  resources :issues
  root 'issues#index'
end
