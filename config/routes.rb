Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
    resources :user_purchase, only: [:create, :index]
  end
end
