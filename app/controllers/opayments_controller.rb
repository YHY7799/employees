class OpaymentsController < ApplicationController
  before_action :set_main
  before_action :set_opayment, only: [:edit, :update, :destroy]

  def create
    @opayment = @main.opayments.build(opayment_params)
    if @opayment.save
      redirect_to @main, notice: 'opayment was successfully created.'
    else
      flash.now[:alert] = 'Failed to create opayment. Please correct the errors below.'
      render 'mains/show', status: :unprocessable_entity
    end
  end

  def edit
    @main = Main.find(params[:main_id])
    @opayment = @main.opayments.find(params[:id])
    @payment_methods = Opayment.payment_methods.keys
  end 

  def update
    @payment_methods = Opayment.payment_methods.keys
    if @opayment.update(opayment_params)
      redirect_to @main, notice: 'opayment was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update opayment. Please correct the errors below.'
      render 'mains/show', status: :unprocessable_entity
    end
  end

  def destroy
    @opayment.destroy!
    redirect_to @main, notice: 'opayment was successfully deleted.'
  end

  private

  def set_main
    @main = Main.find(params[:main_id])
  end

  def set_opayment
    @opayment = @main.opayments.find(params[:id])
  end

  def opayment_params
    params.require(:opayment).permit(:amount, :description, :payment_method)
  end
end
