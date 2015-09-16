class CreateAnnouncementPlanTenants < ActiveRecord::Migration
  def change
    create_table :announcement_plan_tenants do |t|
      t.integer :announcement_id
      t.integer :tenant_id

      t.timestamps null: false
    end
    add_index :announcement_plan_tenants, :announcement_id
    add_index :announcement_plan_tenants, :tenant_id
  end
end
