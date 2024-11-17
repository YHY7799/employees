class DebitsController < ApplicationController
  before_action :set_employee
  before_action :set_debit, only: [:edit, :update, :destroy]

  def create
    @debit = @employee.debits.build(debit_params)
    if @debit.save
      redirect_to @employee, notice: 'Debit was successfully created.'
    else
      flash.now[:alert] = 'Failed to create debit. Please correct the errors below.'
      render 'employees/show', status: :unprocessable_entity
    end
  end

  def edit
  end 

  def update
    if @debit.update(debit_params)
      redirect_to @employee, notice: 'Debit was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update debit. Please correct the errors below.'
      render 'employees/show', status: :unprocessable_entity
    end
  end

  def destroy
    @debit.destroy!
    redirect_to @employee, notice: 'Debit was successfully deleted.'
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_debit
    @debit = @employee.debits.find(params[:id])
  end

  def debit_params
    params.require(:debit).permit(:amount, :description)
  end
end
