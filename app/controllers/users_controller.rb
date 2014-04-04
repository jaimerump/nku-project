class UsersController<ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  
  # Create
  
  def new
    # Make sure they're not already logged in
    @current_user = current_user
    if( @current_user != nil )
      redirect_to users_path
    end
      
    @user = User.new
  end
  
  def create
    
    # Make sure they're not already logged in
    @current_user = current_user
    if( @current_user != nil )
      redirect_to users_path
    end
     
    @user = User.new(user_params)
    if @user.save
        
      # Log them in
      session[:user_id] = @user.id
        
      redirect_to users_path, notice: "User successfully added!"
    else
      render 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end