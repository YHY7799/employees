class Overtime < ApplicationRecord
  belongs_to :employee, inverse_of: :overtimes
end