Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "home#index"
    devise_for :users
    as :user do
      get "/signup", to: "devise/registrations#new"
      post "/signup", to: "devise/registrations#create"
      get "/login", to: "devise/sessions#new"
      post "/login", to: "devise/sessions#create"
      delete "/logout", to: "devise/sessions#destroy"
    end

    resources :products, only: :show
    resources :carts, only: :index

    get "/cart/checkout", to: "carts#checkout"

    resources :pg_transaction, only: %i(index create update new)

    resources :cart_items, only: %i(update create destroy)

    namespace :admins do
      root "home#index"
      resources :categories
    end

    namespace :sellers do
      root "home#index"
      resources :categories, only: :index
      resources :products
    end
  end
end
