class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :is_admin?
  def current_user
    @current_user ||= User.find_by_pennkey(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    @is_admin ||= User.find_by_pennkey(session[:user_id]) if session[:user_id]
    if @is_admin and (@is_admin.privilege == 0 or @is_admin.privilege == 1)
      @is_admin
    else
      nil
    end
  end

  def check_privileges!
    redirect_to root_url, notice: 'You dont have enough permissions to be here' unless is_admin?
  end

end
