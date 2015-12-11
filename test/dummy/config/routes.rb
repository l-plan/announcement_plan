Rails.application.routes.draw do

  resources :roles
  resources :tenants
  resources :users
  resources :cars
  mount AnnouncementPlan::Engine => "/announcement_plan"

  root to: "users#index"
end
