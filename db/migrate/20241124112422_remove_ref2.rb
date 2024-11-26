class RemoveRef2 < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :overtimes, :mains
  end
end
