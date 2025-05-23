Rails.application.routes.draw do
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [:create, :destroy]
  resources :passwords, param: :token
  resources :users, only: [:index]
  scope "/users" do
    resources :workspaces
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
