Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  scope module: :public do
    resource :customers, only: [:show, :edit, :update]
  end
  
  namespace :admin do
    root to:'homes#top'
    resources :items, only: [:new, :create]
  end
  end
