class Overtime < ApplicationRecord
  belongs_to :main, inverse_of: :overtimes
end