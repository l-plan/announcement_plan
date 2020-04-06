module Announcement
  module Plan
    module Generators
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path('../../../../../../db/migrate', __FILE__)

        def initialize(*)
            super
            @names = ActiveRecord::Migrator.migrations(["db/migrate"]).map(&:name)
        end

        def create_announcement_plan_announcements
            name = "CreateAnnouncementPlanAnnouncements"

            @names.include?(name) ? (return say_exists(name) ): say_status("creating migration #{name}", nil, :green)

            copy_file "create_announcement_plan_announcements.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M"+"01")}_create_announcement_plan_announcements.rb"
        end

        def create_announcement_plan_categories
            name = "CreateAnnouncementPlanCategories"

            @names.include?(name) ? (return say_exists(name) ): say_status("creating migration #{name}", nil, :green)

            copy_file "create_announcement_plan_categories.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M"+"02")}_create_announcement_plan_categories.rb"
        end

        def create_announcement_plan_recipients
            name = "CreateAnnouncementPlanRecipients"

            @names.include?(name) ? (return say_exists(name) ): say_status("creating migration #{name}", nil, :green)

            copy_file "create_announcement_plan_recipients.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M"+"03")}_create_announcement_plan_recipients.rb"
        end

        private
        def say_exists(name)
            say_status("migration named #{name} already exists, skipping", nil, :red) if @names.include? name
        end



      
      end
    end
  end
end

