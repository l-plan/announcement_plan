AnnouncementPlan::Engine.routes.draw do
  
  resources :categories

  resources :announcements 
  resources :tenants
  resources :users
  resources :roles
  resources :readers

  root :to => "announcements#index"
end
