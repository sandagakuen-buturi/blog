Rails.application.routes.draw do
  root "public/home#index"
  get "login" => "public/login#index", as: :login

  # PWA
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  namespace :api do
    resources :auth, only: [:index]
    resources :login, only: [:index, :create]
    resources :register, only: [:create]

    resources :invites, only: [:index, :create, :show]
  end
end