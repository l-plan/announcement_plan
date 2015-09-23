module AnnouncementPlan
  class Recipient < ActiveRecord::Base
  	belongs_to :announcement


  	scope :user, -> (user) { where(user_id: user.id)}

  	def user
  		::User.find user_id
  	end
  end


end
