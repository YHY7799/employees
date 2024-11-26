class Debit < ApplicationRecord
  belongs_to :main, inverse_of: :debits 
end