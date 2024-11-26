class Drop < ActiveRecord::Migration[7.1]
  def change
    drop_table :debits
    drop_table :overtimes
  end
end
