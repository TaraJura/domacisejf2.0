Rails.application.routes.draw do
  devise_for :users
  resources :instances
  root 'instances#index'
  # file route
  post 'instances/file', to: 'instances#file'
end
