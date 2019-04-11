Rails.application.routes.draw do
  get 'index' => 'top#index'
  get 'top' => 'top#top'
  get 'about' => 'top#about'
  root to: 'top#top'

  devise_for :users
  # devise_for :users, :controllers => {
  #   :sessions => 'user/sessions',
  #   :registrations => 'user/registrations',
  #   :passwords => 'user/passwords'
  #  }
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :update, :destroy] do
    resources :reviews, only: [:index, :destroy]
    resources :favorites, only: [:index, :destroy]
    resources :visits, only: [:index, :destroy]
  end

  resources :spots do
  	resources :reviews, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :visits, only: [:create]
  end


end
