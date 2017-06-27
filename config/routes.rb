Rails.application.routes.draw do
  resources :issues
  root 'issues#index'
end
