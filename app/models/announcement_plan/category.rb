module AnnouncementPlan
  class Category < ActiveRecord::Base
  	has_many :announcements
  end
end
