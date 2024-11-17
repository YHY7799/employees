class Employee < ApplicationRecord
  has_many :debits, dependent: :destroy, inverse_of: :employee
  accepts_nested_attributes_for :debits

  def gross_salary
    salary.to_f + allowance.to_f
  end

  def total_debits
    debits.sum(:amount)
  end

  def total_salary
    gross_salary - total_debits
  end

  def employees_total_salaries
    employee.sum(:salary)
  end
end

