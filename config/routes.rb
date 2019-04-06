Rails.application.routes.draw do
  get 'index' => 'top#index'
  get 'top' => 'top#top'
  root to: 'top#top'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index, :show, :update]
  resources :spots
end
