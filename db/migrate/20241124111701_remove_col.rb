class RemoveCol < ActiveRecord::Migration[7.1]
  def change
    remove_column :mains, :mains_id
  end
end
