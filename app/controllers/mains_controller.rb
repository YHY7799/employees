class MainsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_main, only: [:show, :edit, :update, :destroy]
  before_action :authorize_main, only: [:show, :edit, :update, :destroy]

  def index
    @years = current_user.mains.distinct.pluck(:year).sort.reverse
    @current_year = params[:year]&.to_i || @years.first || Date.current.year
    @current_month = params[:month]&.to_i || Date.current.month
    @mains = current_user.mains.monthly_records(@current_year, @current_month)
    @current_main_id = @mains.first&.id
  end

  def show
    @main = current_user.mains.includes(:debits, :overtimes).find(params[:id])
    @debit = Debit.new
    @overtime = Overtime.new
    @opayment = Opayment.new
    @payment_methods = Opayment.payment_methods.keys
  end

  def new
    @main = current_user.mains.build
    @years = (Date.current.year-5..Date.current.year+5).to_a
    @months = (1..12).map { |m| [Date::MONTHNAMES[m], m] }
  end

  def create
    @main = current_user.mains.build(main_params)

    if @main.save
      redirect_to @main, notice: 'Record was successfully created.'
    else
      @years = (Date.current.year-5..Date.current.year+5).to_a
      @months = (1..12).map { |m| [Date::MONTHNAMES[m], m] }
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @years = (Date.current.year-5..Date.current.year+5).to_a
    @months = (1..12).map { |m| [Date::MONTHNAMES[m], m] }
  end

  def update
    if @main.update(main_params)
      redirect_to mains_path(year: @main.year, month: @main.month), 
                  notice: 'Record was successfully updated.'
    else
      @years = (Date.current.year-5..Date.current.year+5).to_a
      @months = (1..12).map { |m| [Date::MONTHNAMES[m], m] }
      render :edit
    end
  end

  def mark_selected_fully_paid
    if params[:main_ids].present?
      selected_mains = current_user.mains.where(id: params[:main_ids])
      
      selected_mains.each do |main|
        main.mark_fully_paid! unless main.fully_paid?
      end
  
      redirect_to mains_path(year: params[:year], month: params[:month]), 
                  notice: "The selected employees's salaries have been marked as paid for this month."
    else
      redirect_to mains_path(year: params[:year], month: params[:month]), 
                  alert: "No employees were selected."
    end
  end

  def create_monthly
    year = params[:year].to_i
    month = params[:month].to_i
    
    begin
      Employee.create_monthly_snapshot(year, month, current_user.id) # Pass the user_id
      redirect_to mains_path(year: year, month: month), 
                  notice: "Monthly records created successfully!"
    rescue ActiveRecord::RecordInvalid => e
      redirect_to new_main_path, 
                  alert: "Error creating records: #{e.message}"
    rescue => e
      redirect_to new_main_path, 
                  alert: "Unexpected error: #{e.message}"
    end
  end

  def destroy
    @main.destroy
    redirect_to mains_path, notice: 'Record was successfully deleted.'
  end

  private
    def set_main
      @main = Main.find(params[:id])
    end

    def authorize_main
      unless @main.user_id == current_user.id
        flash[:alert] = "You are not authorized to access this record."
        redirect_to mains_path
      end
    end

    def main_params
      params.require(:main).permit(:name, :salary, :allowance, :comment, :year, :month)
    end
end