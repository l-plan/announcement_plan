module Announcement
  module Plan
    module Generators
      class InstallGenerator < Rails::Generators::Base
         source_root File.expand_path('../../../../../../db/migrate', __FILE__)

      

         def create_announcement_plan_announcements
            say_status("creating announcements", nil, :green)

            copy_file "20150916091446_create_announcement_plan_announcements.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M"+"01")}_create_announcement_plan_announcements.rb.rb"
         end

         def create_announcement_plan_categories
            say_status("creating categories", nil, :green)

            copy_file "20150916092122_create_announcement_plan_categories.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M"+"02")}_create_announcement_plan_categories.rb"
         end

         def create_announcement_plan_recipients
            say_status("creating recipients", nil, :green)

            copy_file "20150916092226_create_announcement_plan_recipients.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M"+"03")}_create_announcement_plan_recipients.rb"
         end

         def create_announcement_plan_announcements_users
            say_status("creating announcements_users", nil, :green)

            copy_file "20151213222939_create_announcement_plan_announcements_users.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M"+"04")}_create_announcement_plan_announcements_users.rb"
         end

         def create_announcement_plan_announcements_tenants
            say_status("creating announcements_tenants", nil, :green)

            copy_file "20151213223928_create_announcement_plan_announcements_tenants.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M"+"05")}_create_announcement_plan_announcements_tenants.rb"
         end

         def create_announcement_plan_role_sources
            say_status("creating role_sources", nil, :green)

            copy_file "20151213223938_create_announcement_plan_announcements_role_sources.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M"+"06")}_create_announcement_plan_role_sources.rb"
         end
                  
      
      end
    end
  end
end

  # source_root File.expand_path("../templates", __FILE__)


            #   str=""
            # str<<"CreateAnnouncementPlanAnnouncements "
            # str<<"title:string:index:name:mijnindex "
            # str<<"tekst:text:index "
            # str<<"start_announcing_at:datetime:index "
            # str<<"stop_announcing_at:datetime:index"
            # str<<"category_id:integer:index "
            # str<<"created_at:datetime "
            # str<<"updated_at:datetime"

            # generate :migration, str