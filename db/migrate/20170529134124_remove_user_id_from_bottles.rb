class RemoveUserIdFromBottles < ActiveRecord::Migration[5.1]
  def change
    remove_column :bottles, :user_id, :integer
  end
end
