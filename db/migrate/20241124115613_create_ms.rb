class CreateMs < ActiveRecord::Migration[7.1]
  def change
    create_table :ms do |t|
    t.integer "month"
    t.integer "year"
    t.string "name"
    t.integer "salary"
    t.integer "allowance"
    t.string "comment"
      t.timestamps
    end
  end
end
