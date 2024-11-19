class OvertimesController < ApplicationController
  before_action :set_employee
  before_action :set_overtime, only: [:edit, :update, :destroy]

  def create
    @overtime = @employee.overtimes.build(overtime_params)
    if @overtime.save
      redirect_to @employee, notice: 'Overtime was successfully created.'
    else
      flash.now[:alert] = 'Failed to create overtime. Please correct the errors below.'
      render 'employees/show', status: :unprocessable_entity
    end
  end

  def edit
  end 

  def update
    if @overtime.update(overtime_params)
      redirect_to @employee, notice: 'Overtime was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update overtime. Please correct the errors below.'
      render 'employees/show', status: :unprocessable_entity
    end
  end

  def destroy
    @overtime.destroy!
    redirect_to @employee, notice: 'Overtime was successfully deleted.'
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_overtime
    @overtime = @employee.overtimes.find(params[:id])
  end

  def overtime_params
    params.require(:overtime).permit(:hours_value, :time)
  end
end
