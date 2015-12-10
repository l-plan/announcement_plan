module AnnouncementPlan
  class Category < ActiveRecord::Base
  	has_many :announcements


  	default_value_for :color, "#ffff88"
  end
end
