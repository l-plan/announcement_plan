class CreateAnnouncementPlanUsers < ActiveRecord::Migration
  def change
    create_table :announcement_plan_users do |t|
      t.integer :announcement_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :announcement_plan_users, :announcement_id
    add_index :announcement_plan_users, :user_id
  end
end
