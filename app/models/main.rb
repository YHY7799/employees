class Main < ApplicationRecord
  has_many :employees, dependent: :destroy
  has_many :debits, dependent: :destroy, inverse_of: :main
  has_many :opayments, dependent: :destroy, inverse_of: :main
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
  def fully_paid?
    total_salary <= 0
  end
  
  def mark_fully_paid!
    # Create a debit for the remaining salary if not already fully paid
    if !fully_paid?
      debits.create(
        amount: total_salary,
        description: 'Full salary payment'
      )
    end
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

  def net_overtime
    overtime_value - opayments.sum(:amount)
  end

  def overtime_salary
    net_overtime + total_salary
  end

  def total_salary_for_month_range(start_month, end_month)
    main(:id).where(month: start_month..end_month).debits.sum(:amount)
  end
end
