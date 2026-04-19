require "sidekiq/web"
require "rack/session/cookie"

Sidekiq::Web.use Rack::Session::Cookie, secret: Rails.application.credentials.secret_key_base, same_site: true, max_age: 86400

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
  resources :home, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :books, path: "/books" do
        get 'generate_ten_books_automatic', on: :collection 
      end

      get 'forecasts/:city', to: "forecasts#index"

      post 'sqs', to: "sqs#producer"
      get 'sqs', to: "sqs#consumer"
    end
  end

  mount Sidekiq::Web => "/sidekiq"
end
