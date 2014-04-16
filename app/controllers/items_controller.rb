class ItemsController<ApplicationController

  skip_before_action :require_login, except: :change_status 
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find( params[:id] )
    respond_to do |format|
      format.html{ render "show" }
      format.json{ render json: @item }
    end
    
  end
  
  def change_status
    # Allows the logged in user to have, want, unhave, or unwant an item
    
    # Check if the item exists
    item = Item.find_by_id( params[:item_id] )
    if !item
      respond_to do |format|
        format.json{
          response = Hash.new
          response['status'] = "Error"
          response['message'] = "Couldn't find the specified item"
          render json: response
        }
      end
    end
    
    # Check for existing record
    existing_record = UserItem.where(user_id: current_user.id, item_id: item.id)[0]
    
    # Switch on status
    new_status = params[:new_status]
    if( new_status == 'have' || new_status == 'want' )
      if( existing_record ) 
        # Update
        existing_record.update(status: new_status )
        respond_to do |format|
          format.json{
            response = Hash.new
            response['status'] = "Success"
            response['message'] = "The record has been updated"
            response['log'] = existing_record
            response['item_id'] = item.id
            response['user_id'] = current_user.id
            render json: response
          }
        end
        
      else
        # Create
        ui = UserItem.create(user_id: current_user.id, item_id: item.id, status: new_status)
        respond_to do |format|
          format.json{
            response = Hash.new
            response['status'] = "Success"
            response['message'] = "You now #{new_status} the item"
            render json: response
          }
        end 
        
      end # End if existing
      
    elsif( new_status == 'unhave' || new_status == 'unwant' )
      # Removing the existing have/want record
      if( !existing_record )
        respond_to do |format|
          format.json{
            response = Hash.new
            response['status'] = "Error"
            response['message'] = "Couldn't find the specified have/want record"
            render json: response
          }
        end 
        
      else
        if( existing_record.status == 'have' && new_status == 'unhave' ) || 
          ( existing_record.status == 'want' && new_status == 'unwant' )
          existing_record.destroy
          respond_to do |format|
            format.json{
              response = Hash.new
              response['status'] = "Success"
              response['message'] = "The record has been removed"
              render json: response
            }
          end 
          
        else
          respond_to do |format|
          format.json{
            response = Hash.new
            response['status'] = "Error"
            response['message'] = "You can't #{new_status} an item you don't #{new_status[2,4]}"
            render json: response
          }
          end
          
        end # End if status matches
        
      end # End if existing
      
    end # End if status
    
  end 
  
end 
