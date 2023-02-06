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
  end

  #会員側ルーティング設定
  scope module: :public do
    root "homes#top"
    get 'homes/about' => "homes#about", as: "about"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
