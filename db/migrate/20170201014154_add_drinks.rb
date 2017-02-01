class AddDrinks < ActiveRecord::Migration[5.0]
  def change

    create_table :drinks do |t|
      t.integer :wine_id, null: false
      t.integer :user_id, null: false
      t.date :date, null: false
      t.string :notes
    end

  end
end
