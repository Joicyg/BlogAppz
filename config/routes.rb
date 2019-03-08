Rails.application.routes.draw do
  devise_for :users
  #get 'welcome/index'
  #resources :welcome
  resources :posts
  #root 'welcome#index'
  resources :post do
    resources :comments
  end
  root 'posts#index'
end
