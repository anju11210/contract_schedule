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
    #NOTE:アポイントを、アポイント登録時から会員と紐づけたいためネストさせる
    #NOTE:appointmentsのnewとcreateのみをネストさせる方法もある（その方が遷移先パスにidを渡す必要がなくミスが減る、※今回は、全てネストした状態で実装したためこのまま）
    get  "customers" => redirect("admin/customers/new")
    resources :customers, only: %i(new create show edit update) do
      resources :appointments, only: %i(new create index show edit update destroy)
      collection do
        get :search
      end
    end

    resources :real_estates, only: %i(new create edit update)
    resources :questions, only: %i(index show update)
    resources :comments, only: %i(create)
  end

  #会員側ルーティング設定
  scope module: :public do
    root "homes#top"
    #NOTE:下記、「get 'homes/about'」と同義（今回の場合はどちらでも良い）
    resource :homes, only: [] do
      get :about
    end

    resources :customers, only: %i(show edit update) do
      get :unsubscribe
      patch :withdraw
      resources :appointments, only: %i(index show)
    end

    resources :questions, only: %i(create index show)
    get '/application/thanks', to: 'homes#thanks'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

