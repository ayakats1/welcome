Rails.application.routes.draw do

  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'

  devise_for :shops, skip: [:passwords], controllers: {
  registrations: "shop/registrations",
  sessions: "shop/sessions"
  }
  scope module: :shop do
    get 'shops/edit/information' => 'shops#edit'
    patch 'shops/my_page' => 'shops#update'
    get 'shops/my_page' => 'shops#show'
    get 'shops/unsubscribe' => 'shops#unsubscribe'
    patch 'shops/unsubscribe' => 'shops#withdraw'
    resources :informations
  end

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
   scope module: :user do
    get 'users/edit/information' => 'users#edit'
    patch 'users/my_page' => 'users#update'
    get 'users/my_page' => 'users#show'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/unsubscribe' => 'users#withdraw'
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
