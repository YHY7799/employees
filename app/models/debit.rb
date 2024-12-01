class Debit < ApplicationRecord
  belongs_to :main, inverse_of: :debits 

  def mark_fully_paid!
    # Set net salary to 0
    update(debit: salary)
  end
end