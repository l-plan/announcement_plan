module AnnouncementPlan
  class Announcement < ActiveRecord::Base
  	has_many :users
  	has_many :readers
  	has_many :roles
  	has_many :tenants

  	belongs_to :category


  	

  end
end
