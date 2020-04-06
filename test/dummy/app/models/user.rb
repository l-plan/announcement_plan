class User < ApplicationRecord
	has_many :recipients, class_name: "AnnouncementPlan::Recipient"
	has_many :announcements, through: :recipients, class_name: "AnnouncementPlan::Announcement"
end
