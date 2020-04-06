module AnnouncementPlan
  class Recipient < ActiveRecord::Base
  	belongs_to :announcement
  	belongs_to :user

  	scope :unread, -> { includes(:announcement).
  		where(announcement_plan_announcements: {start_announcing_at: [(Date.new(0)..Date.today),nil ].flatten,
  			stop_announcing_at: [(Date.tomorrow..Date::Infinity.new), nil].flatten }  ).
  		where(read: nil)

  	}
  		#.
  		#	where(read: nil)}
  		# "announcement_plan_recipients.read is NULL") 

  	# scope :user, -> (user) { where(user_id: user.id)}

  	# def user
  	# 	::User.find user_id
  	# end
  end


end


# AnnouncementPlan::Recipient.includes(:announcement).where(announcement_plan_announcements: {start_announcing_at: Date.new(0)..Date.today})