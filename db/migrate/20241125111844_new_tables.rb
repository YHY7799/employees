class NewTables < ActiveRecord::Migration[7.1]
  def change
    create_table :debits do |t| 
      t.integer :amount 
      t.text :description
      t.references :employee, null: false, foreign_key: true
      t.references :main, null: false, foreign_key: true
    end
  end
end
