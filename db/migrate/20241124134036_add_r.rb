class AddR < ActiveRecord::Migration[7.1]
  def change
    add_reference :debits, :mains, foreign_key: true
    add_reference :overtimes, :mains,  foreign_key: true
  end
end
