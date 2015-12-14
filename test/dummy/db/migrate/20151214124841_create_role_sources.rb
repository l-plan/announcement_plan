class CreateRoleSources < ActiveRecord::Migration
  def change
    create_table :role_sources do |t|
      t.string :naam

      t.timestamps null: false
    end
  end
end
