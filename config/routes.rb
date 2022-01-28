Rails.application.routes.draw do
  devise_for :users
  root "pages#homepage"
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  resources :projects
  resources :tickets
end
