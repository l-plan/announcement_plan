AnnouncementPlan::Engine.routes.draw do
  
  resources :categories

  resources :announcements 

  resources :recipients
  resources :home

  root :to => "home#index"
end
