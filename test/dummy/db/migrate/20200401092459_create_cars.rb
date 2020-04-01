class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :color
      t.string :name

      t.timestamps
    end
  end
end
