class AddDebitReferences < ActiveRecord::Migration[7.1]
  def change
    add_reference :debits, :mains, null: true, foreign_key: true
  end
end
