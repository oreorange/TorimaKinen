Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    # フォロー数、非同期通信のために作成
    get 'follower_counts' => 'relationships#follower_counts'
  end

  resources :events do
    resource :favorites, only: [:create, :destroy]
  end
  
  root 'homes#top'
  get 'homes/support'
  # 検索機能
  get '/search', to: 'searchs#search'
  # 問い合わせ機能
  resources :contacts, only: [:new, :create]
end
