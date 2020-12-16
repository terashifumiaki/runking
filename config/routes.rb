Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# root :to => 'コントローラ名#アクション名'
  root to: 'toppages#index'
  
  # resources :users で生成されるURL である /users/new は少し格好悪く思えます。そんなときには get 'signup' のように個別に設定することで解決します
  get "signup", to: "users#new"
  resources :users, only:[:index, :show, :new, :create]
end
