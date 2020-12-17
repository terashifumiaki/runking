Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# root :to => 'コントローラ名#アクション名'
  root to: 'toppages#index'
  
  # ログイン等の処理はセッション管理用のコントローラ sessions に記述
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # resources :users で生成されるURL である /users/new は少し格好悪く思えます。そんなときには get 'signup' のように個別に設定することで解決します
  get "signup", to: "users#new"
  resources :users, only:[:index, :show, :new, :create]
end
