class Debit < ApplicationRecord
  belongs_to :employee, inverse_of: :debits 
end