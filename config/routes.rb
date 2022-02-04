require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  root "pages#homepage"
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/contacts", to: "pages#contact"
  post "/contacts", to: "pages#create_contact"
  resources :projects
  resources :tickets do 
    member do
      get :update_status
    end
  end
  get "tickets/assign/:id", to: "projects#assign_new", as: "assign_get"
  post "tickets/assign", to: "projects#assign_ticket", as: "assign_ticket"
end
