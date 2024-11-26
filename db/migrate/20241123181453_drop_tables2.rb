class DropTables2 < ActiveRecord::Migration[7.1]
  def change
    drop_table :date_tables
  end
end
