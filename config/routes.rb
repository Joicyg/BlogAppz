Rails.application.routes.draw do
  get 'welcome/index'
  resources :welcome
  resources :posts
  root 'welcome#index'
  resources :post do
    resources :comments
  end
end
