class OvertimesController < ApplicationController
  before_action :set_main
  before_action :set_overtime, only: [:edit, :update, :destroy]

  def create
    @overtime = @main.overtimes.build(overtime_params)
    if @overtime.save
      redirect_to @main, notice: 'Overtime was successfully created.'
    else
      flash.now[:alert] = 'Failed to create overtime. Please correct the errors below.'
      render 'mains/show', status: :unprocessable_entity
    end
  end

  def edit
    @main = Main.find(params[:main_id])
    @overtime = @main.overtimes.find(params[:id])
  end 

  def update
    if @overtime.update(overtime_params)
      redirect_to @main, notice: 'Overtime was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update overtime. Please correct the errors below.'
      render 'mains/show', status: :unprocessable_entity
    end
  end

  def destroy
    @overtime.destroy!
    redirect_to @main, notice: 'Overtime was successfully deleted.'
  end

  private

  def set_main
    @main = Main.find(params[:main_id])
  end

  def set_overtime
    @overtime = @main.overtimes.find(params[:id])
  end

  def overtime_params
    params.require(:overtime).permit(:hours_value, :time)
  end
end
