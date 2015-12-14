AnnouncementPlan::Engine.routes.draw do
  
  resources :categories

  resources :announcements 

  resources :recipients
  resources :cockpits

  root :to => "cockpits#index"
end
