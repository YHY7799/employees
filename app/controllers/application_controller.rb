class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_user_status


  
  private

  def check_user_status
    return if current_user.nil? 
    return if request.path == destroy_user_session_path
  
    case current_user.status
    when 'Suspended' 
      if request.path != user_path(current_user)
        flash[:alert] = "Your account is suspended. Please contact support."
        redirect_to user_path(current_user) and return
      end
    when 'Pending'
      if request.path != user_path(current_user)
        flash[:alert] = "Your account is Pending. We will Activate it soon!."
        redirect_to user_path(current_user) and return
      end
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :business_type, :business_name, :status])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :business_type, :business_name, :status])
  end
  
end