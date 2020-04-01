class CreateAnnouncementPlanAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcement_plan_announcements do |t|
      t.string :title
      t.text :txt
      t.datetime :start_announcing_at
      t.datetime :stop_announcing_at
      t.integer :category_id

      t.timestamps null: false
    end
    add_index :announcement_plan_announcements, :title
    add_index :announcement_plan_announcements, :start_announcing_at
    add_index :announcement_plan_announcements, :stop_announcing_at
    add_index :announcement_plan_announcements, :category_id
  end
end
