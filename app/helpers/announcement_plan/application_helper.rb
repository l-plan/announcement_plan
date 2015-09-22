module AnnouncementPlan
  module ApplicationHelper

		def my_announcements
			Announcement.all.map(&:title)
		end

  end
end
