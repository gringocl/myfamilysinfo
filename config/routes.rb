Myfamilysinfo::Application.routes.draw do

  root :to => "home#index"
 devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users

  get ':users/:id/', :to => "user#show"

  #resources :users, :path => "user"
  resource :user, controller: :users, only: :show do
    resources :kids, only: [:new, :create, :show] do
      resources :reminders do
      end
    end
  end

end
