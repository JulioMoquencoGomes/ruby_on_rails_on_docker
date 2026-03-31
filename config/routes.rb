Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
  resources :home, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :books, path: "/books"
    end
  end
end
