module AnnouncementPlan
  class Addressee < ActiveRecord::Base
  	belongs_to :announcement



	# scope :users, ()


  	def user
  		::User.find user_id
  	end
  end
end
