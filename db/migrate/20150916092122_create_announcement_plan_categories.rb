class CreateAnnouncementPlanCategories < ActiveRecord::Migration
  def change
    create_table :announcement_plan_categories do |t|
      t.string :name
      t.text :color

      t.timestamps null: false
    end
    add_index :announcement_plan_categories, :name
  end
end
