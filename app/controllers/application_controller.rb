class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= User.find(current_user_id) if logged_in?
  end
  
  def logged_in?
    !!session[:user_id]
  end
  helper_method :logged_in?
  
  def current_user_id
    session[:user_id]
  end
  
  def authorize_staff
    redirect_to root_url unless logged_in? && for_staff_only
  end
  
  private
  
  def for_staff_only
    current_user.roles.include? Role.staff.first
  end
end
