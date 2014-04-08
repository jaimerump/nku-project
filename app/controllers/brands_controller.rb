class BrandsController < ApplicationController

  skip_before_action :require_login
  
  def index
    @brands = Brand.all
  end
  
  def show
    @brand = Brand.find( params[:id] )
    respond_to do |format|
      format.html{ render 'show' }
      format.json{ render json: @brand }
    end
    
  end
  
end