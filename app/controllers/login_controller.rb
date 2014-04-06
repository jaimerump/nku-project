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
    
    @user = User.find_by_email(params[:email])
    
    
    if( @user && @user.authenticate( params[:password] ) )
      # Log them in
      session[:user_id] = @user.id
      
      respond_to do |format|
        format.html{
          redirect_to users_path
        }
        format.json{
          response = Hash.new
          response['status'] = "Success"
          response['message'] = "Welcome, #{@user.first_name}"
          render json: response
        }
      end
      
    else
      # Credentials were invalid
      @user = User.new
      
      respond_to do |format|
        format.html{
          flash[:error] = "Invalid email or password"
          render 'index'  
        }
        format.json{
          response = Hash.new
          response['status'] = "Error"
          response['message'] = "Invalid email or password"
          render json: response
        }
      end
    
    end    
  end
  
  def logout
    # Clear their session and redirect
    session[:user_id] = nil
    redirect_to login_page_path
  end
  
end
