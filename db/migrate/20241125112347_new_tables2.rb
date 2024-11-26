class NewTables2 < ActiveRecord::Migration[7.1]
  def change
    create_table :overtimes do |t| 
      t.integer :hours_value 
      t.date :time
      t.references :employee, null: false, foreign_key: true
      t.references :main, null: false, foreign_key: true
    end
  end
end
