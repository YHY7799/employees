class AddRef2 < ActiveRecord::Migration[7.1]
  def change 
    remove_index :debits, :mains_id
    remove_index :overtimes, :mains_id
    remove_column :debits, :main_id
    remove_column :overtimes, :main_id
  end
end
