Rails.application.routes.draw do

  resources :roles
  mount AnnouncementPlan::Engine => "/announcement_plan"
  resources :cars
  resources :users
end
