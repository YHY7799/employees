class DebitsController < ApplicationController
  before_action :set_main
  before_action :set_debit, only: [:edit, :update, :destroy]

  def create
    @debit = @main.debits.build(debit_params)
    if @debit.save
      redirect_to @main, notice: 'Debit was successfully created.'
    else
      flash.now[:alert] = 'Failed to create debit. Please correct the errors below.'
      render 'mains/show', status: :unprocessable_entity
    end
  end

  def edit
    @main = Main.find(params[:main_id])
    @debit = @main.debits.find(params[:id])
  end 

  def update
    if @debit.update(debit_params)
      redirect_to @main, notice: 'Debit was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update debit. Please correct the errors below.'
      render 'mains/show', status: :unprocessable_entity
    end
  end

  def destroy
    @debit.destroy!
    redirect_to @main, notice: 'Debit was successfully deleted.'
  end

  private

  def set_main
    @main = Main.find(params[:main_id])
  end

  def set_debit
    @debit = @main.debits.find(params[:id])
  end

  def debit_params
    params.require(:debit).permit(:amount, :description)
  end
end
