class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  
  def current_user
    # Returns the currently logged in user
    if( session[:user_id] == nil )
      return nil
    end
    return User.find( session[:user_id] )
  end
  helper_method :current_user
 
  private
 
  def require_login
    if current_user == nil
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_page_path # halts request cycle
    end
  end
  
end
