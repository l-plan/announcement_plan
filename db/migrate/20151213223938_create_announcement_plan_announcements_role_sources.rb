class CreateAnnouncementPlanAnnouncementsRoleSources < ActiveRecord::Migration
  def change
    create_table :announcement_plan_announcements_role_sources, id: false do |t|
    	t.integer :announcement_id, index: {name: 'announcements_role_sources_announcement_id'}
    	t.integer :role_source_id, index: {name: 'announcements_role_sources_role_source_id'}
    end
  end
end
