class CreateAnnouncementPlanAnnouncementsTenants < ActiveRecord::Migration
  def change
    create_table :announcement_plan_announcements_tenants, id: false do |t|
    	t.integer :announcement_id, index: true
    	t.integer :tenant_id, index: true
    end
  end
end
