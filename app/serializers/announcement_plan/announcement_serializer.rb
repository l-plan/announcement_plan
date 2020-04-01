module AnnouncementPlan
	class AnnouncementSerializer < ActiveModel::Serializer
	  attributes :id, :txt, :title, :category_color, :category_name, :start_announcing_at, :stop_announcing_at
	end
end