class DashboardController < ApplicationController
    
  def index
    @properties = Property.all
  end
  
  def signUp
    
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  
  def show
    id = params[:id]
    @property = Property.find(id)
  end

end