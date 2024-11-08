module Administrator
  module UsersHelper

    # Check if a user is logged in by verifying the presence of `user_username` in session
    def logged_in?
      !!session[:user_username]
    end
  
    # Retrieve the current user based on the session data, caching the user instance
    def current_user
      @current_user ||= User.find_by(username: session[:user_username]) if logged_in?
    end
  end
 end 