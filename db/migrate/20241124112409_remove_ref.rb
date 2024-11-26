class RemoveRef < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :debits, :mains
  end
end
