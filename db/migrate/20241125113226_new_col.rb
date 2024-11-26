class NewCol < ActiveRecord::Migration[7.1]
  def change
    add_column :debits, :created_at, :datetime
    add_column :debits, :updated_at, :datetime
    add_column :overtimes, :created_at, :datetime
    add_column :overtimes, :updated_at, :datetime
  end
end
