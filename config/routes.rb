Rails.application.routes.draw do

  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  devise_scope :shop do
    post 'shops/guest_sign_in', to: 'shop/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top', as: 'top'
    resources :reviews, only:[:index, :show, :destroy]
    resources :posts, only:[:index, :show, :destroy]
    resources :users, only:[:index, :show, :edit, :update, :destroy]
    resources :shops, only:[:show, :edit, :update, :destroy]
  end

  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'

  devise_for :shops, skip: [:passwords], controllers: {
  registrations: "shop/registrations",
  sessions: "shop/sessions"
  }

  namespace :shop do
    resource :shop, only: %i(show edit update) do # お店の情報を更新する(index以外使う)
      get :unsubscribe
      patch :withdraw
    end
    resources :posts # お店から広告を投稿や管理する。
  end

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  scope module: :user do
    resources :shops, only: [:index, :show]# お店の詳細や一覧を見る関連
    resources :posts, only: [:index, :show] do # お店の投稿された広告などを表示する関連
      resources :reviews, only: [:new, :create, :destroy] # コメントをしたり、レビューをしたりする関連
    end

    get "search" => "searches#search"
    # マイページ (お気に入り投稿が見ることができて自分の情報を編集することもできる)
    get 'users/edit/post' => 'users#edit'
    patch 'users/my_page' => 'users#update'
    get 'users/my_page' => 'users#show'

    # 退会
    get '/unsubscribe' => 'users#unsubscribe'
    patch '/unsubscribe' => 'users#withdraw'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
