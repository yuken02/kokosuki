Rails.application.routes.draw do

  devise_for :users, controllers: {
   registrations: 'user/registrations',
   sessions: 'user/sessions',
  # omniauth_callbacks: 'users/omniauth_callbacks'
  }

  scope module: :user do
    root to: 'homes#top'
    get "mypage"=>"homes#show"
    resources :clips, only: [:index,:show,:new,:create,:edit,:update,:destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
    end
    resources :playlists, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :playlist_videos, only: [:create, :destroy], param: :id
      # resources :playlist_videos, only: [:create, :destroy], param: :clip_id
    end
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
