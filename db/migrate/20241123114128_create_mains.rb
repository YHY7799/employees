class CreateMains < ActiveRecord::Migration[7.1]
  def change
    create_table :mains do |t|
      t.integer :month
      t.integer :year
      t.string :name
      t.integer :salary
      t.integer :allowance
      t.string :comment
      
      t.timestamps
    end
    add_index :mains, [:year, :month], unique: true
  end
end
