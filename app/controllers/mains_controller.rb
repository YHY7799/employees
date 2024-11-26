class MainsController < ApplicationController
  before_action :set_main, only: [:show, :edit, :update, :destroy]

  def index
    @years = Main.distinct.pluck(:year).sort.reverse
    @current_year = params[:year]&.to_i || @years.first || Date.current.year
    @current_month = params[:month]&.to_i || Date.current.month
    
    @mains = Main.monthly_records(@current_year, @current_month)
  end

  def show
    @main = Main.includes(:debits, :overtimes).find(params[:id])
    @debit = Debit.new
    @overtime = Overtime.new
  end

  def new
    @main = Main.new
    @years = (Date.current.year-5..Date.current.year+5).to_a
    @months = (1..12).map { |m| [Date::MONTHNAMES[m], m] }
  end

  def create_monthly
    year = params[:year].to_i
    month = params[:month].to_i
    
    begin
      Employee.create_monthly_snapshot(year, month)
      redirect_to mains_path(year: year, month: month), 
                  notice: "Monthly records created successfully!"
    rescue ActiveRecord::RecordInvalid => e
      redirect_to new_main_path, 
                  alert: "Error creating records: #{e.message}"
    end
  end

  # Standard CRUD actions...
 

  def edit
    @years = (Date.current.year-5..Date.current.year+5).to_a
    @months = (1..12).map { |m| [Date::MONTHNAMES[m], m] }
    
  end

  def create
    @main = Main.new(main_params)

    if @main.save
      redirect_to @main, notice: 'Record was successfully created.'
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @main.errors, status: :unprocessable_entity }
    end
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

  def destroy
    @main.destroy
    redirect_to mains_url, notice: 'Record was successfully deleted.'
  end

  private
    def set_main
      @main = Main.find(params[:id])
    end

    def main_params
      params.require(:main).permit(:name, :salary, :allowance, :comment, :year, :month)
    end
end