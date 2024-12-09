class Employee < ApplicationRecord
  belongs_to :user
  WORKING_DAYS = 30
  WORKING_HOURS = 9

  def gross_salary
    salary.to_f + allowance.to_f
  end

 

  def total_salary
    gross_salary 
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



 
  
  def self.create_monthly_snapshot(year, month, user_id)
    transaction do
      existing_records = Main.where(year: year, month: month, user_id: user_id).pluck(:name)
      
      # Filter employees belonging to the given user
      Employee.where(user_id: user_id).each do |employee|
        # Skip if record already exists for this employee in this month
        next if existing_records.include?(employee.name)
        
        Main.create!(
          name: employee.name,
          salary: employee.salary,
          allowance: employee.allowance,
          email: employee.email,
          phone: employee.phone,
          comment: employee.comment,
          year: year,
          month: month,
          user_id: user_id # Associate with the current user
        )
      end
    end
  end
  
  


end

