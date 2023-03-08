Rails.application.routes.draw do
  root to: 'homes#top'
  resources :clips, only: [:index,:show,:new,:create,:edit,:update,:destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
