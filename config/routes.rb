Rails.application.routes.draw do
  #Devise関連のカスタムコントローラー設定
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'


end
