AnnouncementPlan::Engine.routes.draw do
  
  resources :categories

  resources :announcements 
  resources :tenants
  resources :addressees
  resources :roles
  resources :recipients
  resources :cockpits

  root :to => "cockpits#index"
end
