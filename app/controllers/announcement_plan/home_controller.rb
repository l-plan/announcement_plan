# require_dependency "announcement_plan/application_controller"

module AnnouncementPlan
  class HomeController < ApplicationController

  	def index
  		@categories = AnnouncementPlan::Category.all
  		@announcements = AnnouncementPlan::Announcement.take(3)
  	end
  end
end