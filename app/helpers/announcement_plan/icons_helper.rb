module AnnouncementPlan
	module IconsHelper
		def homeLink
			'<i class="fal fa-home fa-lg" style="color:grey"></i>'.html_safe
		end

		def editIcon
			'<i class="fal fa-edit" style="color:grey"></i>'.html_safe
		end

		def showIcon
			'<i class="fal fa-eye" style="color:grey"></i>'.html_safe
		end

		def indexIcon
			'<i class="fal fa-list-ul" style="color:grey"></i>'.html_safe
		end

		def destroyIcon
			'<i class="fal fa-trash-alt" style="color:grey"></i>'.html_safe
		end

		def iconCheck?(val)
			val ? iconCheck : iconSquare
		end

		def iconSquare
			'<i class="fal fa-square grey"></i>'.html_safe
		end

		def iconCheck
			'<i class="fal fa-check-square fa-lg" style="color:green"></i>'.html_safe
		end
	end
end
