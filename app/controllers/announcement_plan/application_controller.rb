module AnnouncementPlan
	class ApplicationController < ::ApplicationController


		private

		def create_notice
			"#{controller_name.singularize}  was successfully created."
		end

		def update_notice
			"#{controller_name.singularize}  was successfully updated."
		end

		def destroy_notice
			"#{controller_name.singularize}  was successfully destroyed."
		end

		end

end
