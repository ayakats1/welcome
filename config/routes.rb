Rails.application.routes.draw do
  namespace :shop do
    get 'shops/show'
    get 'shops/edit'
  end
  root to: 'homes#top'
  get 'homes/about'
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  devise_for :shops, skip: [:passwords], controllers: {
  registrations: "shop/registrations",
  sessions: "shop/sessions"
  }
  namespace :user do
    get 'comments/new'
    get 'comments/edit'
  end
  namespace :shop do
    get 'posts/index'
    get 'posts/new'
    get 'posts/edit'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
