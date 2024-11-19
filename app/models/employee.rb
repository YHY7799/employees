class Employee < ApplicationRecord
  has_many :debits, dependent: :destroy, inverse_of: :employee
  has_many :overtimes, dependent: :destroy, inverse_of: :employee

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

