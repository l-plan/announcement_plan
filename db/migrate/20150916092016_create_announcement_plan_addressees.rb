class CreateAnnouncementPlanAddressees < ActiveRecord::Migration
  def change
    create_table :announcement_plan_addressees do |t|
      t.integer :announcement_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :announcement_plan_addressees, :announcement_id
    add_index :announcement_plan_addressees, :user_id
  end
end