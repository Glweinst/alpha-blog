class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    # ||= means 'if not, then...'. This code checks to see if there is a user, and if there is, then it finds
    # which user id the user has and saves it as current_user
  end
  
  def logged_in?
    !!current_user
    # !!xxxx is the command for a boolean in ruby. This returns true if there is a current user, and false
    # if there isn't
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
  
end
