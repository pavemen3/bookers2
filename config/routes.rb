Rails.application.routes.draw do
  # devise_for :users, :controllers => {
  #   :sessions => 'users/sessions',
  #   :registrations => 'users/registrations'
  # }
  devise_for :users
  root to: 'homes#top'
  get "home/about" ,to: 'homes#about', as: "about"
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :books

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
