class BrandsController < ApplicationController

  skip_before_action :require_login
  
  def show
    @brand = Brand.find( params[:id] )
  end
  
end