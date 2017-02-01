class AddWines < ActiveRecord::Migration[5.0]
  def change

    create_table :wines do |t|
      t.string :name, null: false
      t.string :vintage
      t.string :style
      t.integer :rating
      t.string :notes
      t.integer :winemaker_id
    end

  end
end
