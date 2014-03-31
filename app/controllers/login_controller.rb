class LoginController < ApplicationController
  
  skip_before_action :require_login, only: [:index, :login]
  
  def index
    # Displays the login page
    
    # Make sure they're not already logged in
    if( current_user != nil )
      redirect_to users_path
    end
    
    # Create blank user for form to use
    @user = User.new
    
  end


  def login
    # Processes the login form
    
    @user = User.find_by_email(params[:user][:email])
    
    if( @user && @user.authenticate( params[:user][:password] ) )
      # Log them in
      session[:user_id] = @user.id
      redirect_to users_path
    else
      # Credentials were invalid
      @user = User.new
      flash.now.notice = "Invalid email or password"
      render 'index'
    end
    
  end
  
  def logout
    # Clear their session and redirect
    session[:user_id] = nil
    redirect_to users_path
  end
  
end
