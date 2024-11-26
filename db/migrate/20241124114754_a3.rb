class A3 < ActiveRecord::Migration[7.1]
  def change
    add_reference :overtimes, :mains
  end
end
