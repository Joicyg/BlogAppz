Rails.application.routes.draw do
  devise_for :users
  # get 'welcome/index'
  # resources :welcome
  resources :posts
  # root 'welcome#index'
  resources :post do
    resources :comments
  end
  root 'posts#index'
	namespace :api do
    namespace :v1 do
      resources :posts
	end
	end
end
