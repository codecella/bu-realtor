class DashboardController < ApplicationController
    
  def index
    @properties = Property.all
  end
  
  def signUp
    
  end
  
  def show
    id = params[:id]
    @property = Property.find(id)
  end

end