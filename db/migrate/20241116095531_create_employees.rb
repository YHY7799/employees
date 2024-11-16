class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :salary
      t.integer :allowance
      t.text :comment

      t.timestamps
    end
  end
end
