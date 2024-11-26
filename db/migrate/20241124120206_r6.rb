class R6 < ActiveRecord::Migration[7.1]
  def change
    remove_index :overtimes, :mains_id
    remove_column :overtimes, :mains_id
    remove_index :debits, :mains_id
    remove_column :debits, :mains_id
  end
end
