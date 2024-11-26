class FixForeignKeyNames < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :debits, :mains
    remove_foreign_key :overtimes, :mains
    
    # Remove the existing indexes
    remove_index :debits, :mains_id if index_exists?(:debits, :mains_id)
    remove_index :overtimes, :mains_id if index_exists?(:overtimes, :mains_id)
    
    # Rename the columns
    rename_column :debits, :mains_id, :main_id
    rename_column :overtimes, :mains_id, :main_id
    
    # Add new indexes
    add_index :debits, :main_id
    add_index :overtimes, :main_id
    
    # Add new foreign keys
    add_foreign_key :debits, :mains
    add_foreign_key :overtimes, :mains
  end
end
