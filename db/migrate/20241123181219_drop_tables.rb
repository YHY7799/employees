class DropTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :duplicates
  end
  
end
