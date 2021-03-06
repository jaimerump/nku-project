class UsersController<ApplicationController

  skip_before_action :require_login, only: [:new, :create, :show]
  
  def index
    @users = User.all
  end
  
  def show
    @host = User.find( params[:id] )
    respond_to do |format|
      format.html{ render 'show' }
      format.json{ 
        @host.password_digest = ""
        render json: @host
      }
    end
      
  end
  
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
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json{
          response = Hash.new
          response['status'] = "Error"
          response['message'] = "You're already logged in!"
          render json: response
        }
      end
    end
     
    @user = User.new(user_params)
    if @user.save
        
      # Log them in
      session[:user_id] = @user.id
      
      respond_to do |format|
        format.html{ redirect_to users_path }
        format.json{
          response = Hash.new
          response['status'] = 'Success'
          response['message'] = "Welcome, #{@user.first_name}!"
          render json: response
        }
      end
    else
      
      respond_to do |format|
        format.html{ render 'new' }
        format.json{
          response = Hash.new
          response['status'] = 'Error'
          response['message'] = "#{@user.errors.full_messages.join(", ")}"
          render json: response
        }
      end
      
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    
    if @user.id != current_user.id
      respond_to do |format|
        format.html { redirect_to users_path, notice: "You can't edit someone else's settings!" }
        format.json{
          response = Hash.new
          response['status'] = "Error"
          response['message'] = "You can't edit someone else's settings!"
          render json: response
        }
      end
    end
      
      if @user.update(user_params)
        respond_to do |format|
          format.html{ redirect_to user_path(@user) }
          format.json{
            response = Hash.new
            response[:status] = "Success"
            response[:message] = "Your settings have been updated!"
            render json: response
          }
        end
      else
        respond_to do |format|
          format.html{ render 'edit' }
          format.json{
            response = Hash.new
            response[:status] = "Error"
            response[:message] = "#{@user.errors.full_messages.join(", ")}"
            render json: response
          }
        end
      end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end