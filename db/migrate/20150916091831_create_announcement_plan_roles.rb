class CreateAnnouncementPlanRoles < ActiveRecord::Migration
  def change
    create_table :announcement_plan_roles do |t|
      t.integer :announcement_id
      t.string :name

      t.timestamps null: false
    end
    add_index :announcement_plan_roles, :announcement_id
    add_index :announcement_plan_roles, :name
  end
end
