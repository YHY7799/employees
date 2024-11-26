class R2 < ActiveRecord::Migration[7.1]
  def change
    remove_index :debits, :mains_id
    remove_column :debits, :mains_id
  end
end
