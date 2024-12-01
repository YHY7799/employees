class AddOpaymentTable < ActiveRecord::Migration[7.1]
  def change
     create_table :opayments do |t|
      t.string :payment_method
      t.text :description
      t.references :main, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
     end
  end
end
