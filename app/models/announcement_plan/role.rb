module AnnouncementPlan
  class Role < ActiveRecord::Base
  	belongs_to :announcement

  	def role
  		::Role.find_by(name: name)
  	end
  end



end
