class AddBottles < ActiveRecord::Migration[5.0]
  def change

    create_table :bottles do |t|
      t.integer :wine_id, null: false
      t.integer :user_id, null: false
      t.date :date_purchased, null: false
      t.date :date_opened
      t.string :notes
    end

  end
end
