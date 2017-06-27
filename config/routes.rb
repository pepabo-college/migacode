Rails.application.routes.draw do
  resources :issues
  root 'welcome#index'
end
