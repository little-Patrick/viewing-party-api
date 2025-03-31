Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      namespace :movie do
        get "/details/id", to: "details#show"
        resources :search, only: :index
        resources :top_movies, only: :index
      end
      resources :users, only: [:create, :index]
      resources :sessions, only: :create
      resources :viewing_parties, only: :create
      patch "/viewing_parties/:id", to: "viewing_parties#update"
    end
  end
end
