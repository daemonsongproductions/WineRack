class CreateUserBottles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_bottles do |t|
      t.integer :user_id, null: false
      t.integer :bottle_id, null: false
      t.timestamps null: false

    end
  end
end
