class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
=begin
  helper :all
  before_action :authenticate_user!
=end

  def set_current_admin
    if session[:username]
      Current.admin = Admin.find_by(username: session[:username])
    else
      redirect_to adminaccess_path
    end
  end

  def current_user
    @current_user ||= User.find_by(username: session[:user_username]) if session[:user_username]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section."
      redirect_to login_path
    end
  end
end
