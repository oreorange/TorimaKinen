Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,only: [:show, :edit]
  resources :anniversaries,only: [:create, :update, :destroy]
  resources :events
  root 'homes#top'
end
