class CreateOvertimes < ActiveRecord::Migration[7.1]
  def change
    create_table :overtimes do |t|
      t.integer :hours_value
      t.datetime :time
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
