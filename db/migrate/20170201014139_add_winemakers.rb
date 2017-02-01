class AddWinemakers < ActiveRecord::Migration[5.0]
  def change

    create_table :winemakers do |t|
      t.string :name, null: false
      t.string :region
      t.string :notes
    end

  end
end
