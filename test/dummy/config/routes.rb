Rails.application.routes.draw do

  mount AnnouncementPlan::Engine => "/announcement_plan"
  resources :cars
  resources :users
end
