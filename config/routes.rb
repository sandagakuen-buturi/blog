Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  namespace :api do
    resource :auth, only: [:create]
    resource :login, only: [:create]
    resource :register, only: [:create]

    resources :invites, only: [:index, :create, :show]
  end
end