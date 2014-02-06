Myfamilysinfo::Application.routes.draw do

  root :to => "home#index"
 devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}



  #resources :users, :path => "user"
  resource :user, controller: :users, only: :show do
    resources :kids, only: [:new, :create] do
      resources :reminders, only: [:new, :create] do
      end
    end
  end
  resources :kids, only: [:destroy]
  resources :reminders, only: [:destroy, :update]
end
