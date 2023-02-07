Rails.application.routes.draw do
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:registrations, :passwords], controllers: {
    sessions: 'public/sessions'
  }

  #管理者側ルーティング設定
  namespace :admin do
    get "/" => "homes#top"
    resources :customers, only: [:new, :create, :show, :edit, :update]
    resources :real_estates, only: [:new, :create, :edit, :update]
    resources :appointments, only: [:new, :create, :index, :show, :edit, :update]
    resources :questions, only: [:index, :update]
  end

  #会員側ルーティング設定
  scope module: :public do
    root "homes#top"
    get 'homes/about' => "homes#about", as: "about"
    resources :customers, only: [:show, :edit, :update]
    get "/customers/:id/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "/customers/:id/withdraw" => "customers#withdraw", as: "withdraw"
    resources :appointments, only: [:index, :show]
    resources :questions, only: [:index, :create, :show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
