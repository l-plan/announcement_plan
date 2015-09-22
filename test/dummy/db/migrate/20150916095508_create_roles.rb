class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :naam
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
