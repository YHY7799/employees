class Employee < ApplicationRecord
  has_many :debits, dependent: :destroy, inverse_of: :employee
  accepts_nested_attributes_for :debits
end

def total_debit
  debits.sum(:amount)
end