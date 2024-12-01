class Opayment < ApplicationRecord
  belongs_to :main, inverse_of: :opayments
  enum payment_method: { Bank: 0, Cash: 1 }
  
end