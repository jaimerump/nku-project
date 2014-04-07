class BrandsController < ApplicationController

  skip_before_action :require_login
  
  def index
    @brands = Brand.all
  end
  
  def show
    @brand = Brand.find( params[:id] )
  end
  
end