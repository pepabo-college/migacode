Rails.application.routes.draw do
  root 'welcome#index'
  resources :replies, only: :new
end
