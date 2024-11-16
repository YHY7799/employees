class CreateDebits < ActiveRecord::Migration[7.1]
  def change
    create_table :debits do |t|
      t.integer :amount
      t.text :description
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
