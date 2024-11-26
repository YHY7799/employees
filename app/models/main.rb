class Main < ApplicationRecord
  has_many :employees, dependent: :destroy, inverse_of: :main
  has_many :debits, dependent: :destroy, inverse_of: :main
  has_many :overtimes, dependent: :destroy, inverse_of: :main
  validates :year, presence: true, numericality: { only_integer: true }
  validates :month, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :name, uniqueness: { scope: [:year, :month], 
  message: "already has a record for this month/year" }

  def self.monthly_records(year, month)
  where(year: year, month: month)
  end
  
  def self.monthly_records(year, month)
    where(year: year, month: month)
  end

  
  WORKING_DAYS = 30
  WORKING_HOURS = 9

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

  def daily_gross_salary
    salary / WORKING_DAYS
  end

  def daily_net_salary
    gross_salary / WORKING_DAYS
  end

  def gross_salary_hour
    daily_gross_salary / WORKING_HOURS
  end

  def net_salary_hour
    daily_net_salary / WORKING_HOURS
  end

  def overtime_value
    if overtimes.sum(:hours_value) > 0
      net_salary_hour + (0.5 * gross_salary_hour) * overtimes.sum(:hours_value)
    else
      0
    end
  
  end 

  def overtime_salary
    overtime_value + total_salary
  end
end
