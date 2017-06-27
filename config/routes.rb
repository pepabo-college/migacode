Rails.application.routes.draw do
  resources :issues do
    resources :replies, only: :create
  end
  root 'issues#index'
end
