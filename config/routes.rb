Rails.application.routes.draw do
  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :show, :edit, :update, :destroy] do
    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  root 'sounds#index'

  resources :sounds

  get '/sound/:id/share' => 'sounds#share', as: 'share_sound'
  resources :authorizations, only: [:create, :destroy]
end
