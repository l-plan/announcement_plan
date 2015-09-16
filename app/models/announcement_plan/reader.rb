module AnnouncementPlan
  class Reader < ActiveRecord::Base
  	belongs_to :announcement

  	def user
  		::User.find user_id
  	end
  end


end
