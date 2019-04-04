Rails.application.routes.draw do
  get 'top/index'
  root to: 'top#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
end
