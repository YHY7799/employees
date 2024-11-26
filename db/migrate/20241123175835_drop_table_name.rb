class DropTableName < ActiveRecord::Migration[7.1]
  def change
    drop_table :date_tables
  end
  def change
    drop_table :duplicates
  end
  def change 
    drop_table :employee_data
  end
end
