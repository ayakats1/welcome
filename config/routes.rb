Rails.application.routes.draw do

  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'

  devise_for :shops, skip: [:passwords], controllers: {
  registrations: "shop/registrations",
  sessions: "shop/sessions"
  }

  # namespace :shop do
  #   resources :shops, except: [:index] # お店の情報を更新する(index以外使う)
  #   resources :posts # お店から広告を投稿や管理する。
  # end

  # scope module: :user do
  #   resources :shops, only: [:index, :show] do # お店の詳細や一覧を見る関連
  #     resources :posts, only: [:index, :show] do # お店の投稿された広告などを表示する関連
  #       resources :comments, only: [:new, :create, :destroy] # コメントをしたり、レビューをしたりする関連
  #     end
  #   end

  #   # マイページ (お気に入り投稿が見ることができて自分の情報を編集することもできる)
  #   get '/my_page' => 'users#show'
  #   patch '/my_page' => 'users#update'

  #   # 退会
  #   get '/unsubscribe' => 'users#unsubscribe'
  #   patch '/unsubscribe' => 'users#withdraw'
  # end

  scope module: :shop do
    get 'shops/edit/post' => 'shops#edit'
    patch 'shops/my_page' => 'shops#update'
    get 'shops/my_page' => 'shops#show'
    get 'shops/unsubscribe' => 'shops#unsubscribe'
    patch 'shops/unsubscribe' => 'shops#withdraw'
    resources :posts
  end

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  scope module: :user do
    get 'users/edit/post' => 'users#edit'
    patch 'users/my_page' => 'users#update'
    get 'users/my_page' => 'users#show'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/unsubscribe' => 'users#withdraw'
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
