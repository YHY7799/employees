class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, except: [:show]
  before_action :require_correct_user, only: [:show]

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def pending
    render 'pending'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
    @employees = @user.employees 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end

  private
    
  

  def require_admin
    unless current_user && current_user.admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_correct_user
    unless current_user == User.find(params[:id]) || current_user.admin?
      flash[:alert] = "You can only view your own profile."
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :password, 
      :password_confirmation,
      :business_type, 
      :business_name, 
      :status,
      :admin
    )
  end
end