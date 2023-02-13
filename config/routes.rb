Rails.application.routes.draw do
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: %i(registrations passwords), controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: %i(registrations passwords), controllers: {
    sessions: 'public/sessions'
  }

  #管理者側ルーティング設定
  namespace :admin do
    root "homes#top"
    #アポイントを、アポイント登録時から会員と紐づけたいため
    resources :customers, only: %i(new create show edit update) do
      resources :appointments, only: %i(new create index show edit update)
    end

    resource :customers, only: [] do
      get :search
    end
    resources :real_estates, only: %i(new create edit update)
    resources :questions, only: %i(index update)
  end

  #会員側ルーティング設定
  scope module: :public do
    root "homes#top"

    resource :homes, only: [] do
      get :about
    end

    resources :customers, only: %i(show edit update) do
      get :unsubscribe
      patch :withdraw
    end

    resources :appointments, only: %i(index show)
    resources :questions, only: %i(create index show)
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
