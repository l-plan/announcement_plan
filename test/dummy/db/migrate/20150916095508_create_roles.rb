class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :role_source_id
      t.integer :user_id
      t.integer :tenant_id

      t.timestamps null: false
    end
  end
end
