Rails.application.routes.draw do
  devise_for :users
  root "pages#homepage"
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  resources :projects
  resources :tickets
  get "tickets/assign/:id", to: "projects#assign_new", as: "assign_get"
  post "tickets/assign", to: "projects#assign_create", as: "assign_post"
end
