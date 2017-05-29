class AddTimestampsToAllTables < ActiveRecord::Migration[5.1]
  def change
    add_column(:wines, :created_at, :datetime)
    add_column(:wines, :updated_at, :datetime)
    add_column(:winemakers, :created_at, :datetime)
    add_column(:winemakers, :updated_at, :datetime)
    add_column(:glasses, :created_at, :datetime)
    add_column(:glasses, :updated_at, :datetime)
    add_column(:bottles, :created_at, :datetime)
    add_column(:bottles, :updated_at, :datetime)
  end
end
