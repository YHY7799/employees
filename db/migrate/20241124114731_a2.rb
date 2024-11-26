class A2 < ActiveRecord::Migration[7.1]
  def change
    add_reference :debits, :mains
  end
end
