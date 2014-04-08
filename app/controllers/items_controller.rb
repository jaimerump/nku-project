class ItemsController<ApplicationController

  skip_before_action :require_login
  
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
  
end