Myfamilysinfo::Application.routes.draw do

  root :to => "home#index"
 devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users


  #resources :users, :path => "user"
  resource :user, controller: :users, only: :show do
    resources :kids, only: [:new, :create]
  end

end
