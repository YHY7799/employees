class Employee < ApplicationRecord
  
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



 
  
  def self.create_monthly_snapshot(year, month)
    transaction do
      existing_records = Main.where(year: year, month: month).pluck(:name)
      
      Employee.all.each do |employee|
        # Skip if record already exists for this employee in this month
        next if existing_records.include?(employee.name)
        
        Main.create!(
          name: employee.name,
          salary: employee.salary,
          allowance: employee.allowance,
          comment: employee.comment,
          year: year,
          month: month
        )
      end
    end
  end


end

