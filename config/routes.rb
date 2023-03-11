Rails.application.routes.draw do

  devise_for :users, controllers: {
   registrations: 'users/registrations',
   sessions: 'users/sessions',
  # omniauth_callbacks: 'users/omniauth_callbacks'
  }

  scope module: :user do
    root to: 'homes#top'
    resources :clips, only: [:index,:show,:new,:create,:edit,:update,:destroy]

  end

  # URL /customers/sign_in ...
  # devise_for :customers,skip: [:passwords], controllers: {
  #   registrations: "public/registrations",
  #   sessions: 'public/sessions'
  # }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
