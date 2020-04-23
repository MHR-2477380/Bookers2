Rails.application.routes.draw do

  devise_for :users #devise機能で自動生成されたもの

  root to: 'homes#top'

  get 'home/about' => 'homes#about'

  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
