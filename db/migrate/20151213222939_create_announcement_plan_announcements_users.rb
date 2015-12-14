class CreateAnnouncementPlanAnnouncementsUsers < ActiveRecord::Migration
  def change
    create_table :announcement_plan_announcements_users, id: false do |t|
    	t.integer :announcement_id, index: true
    	t.integer :user_id, index: true
    end
  end
end