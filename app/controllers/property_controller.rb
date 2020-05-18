class PropertyController < ApplicationController
  
  #still need to add the redirection for each method after the action
  
  def property_params
    params.require(:property).permit(:name, :apttype, :price, :address, :description)
  end
  
  def new
    @properties = Property.new
  end

  def create
    @property= Property.create!(property_params)
    flash[:notice] = "#{@property.name} was succesfully added"
    redirect_to propertyDetail_path(@property)
  end

  def edit
    @property = Property.find params[:id]
    #flash[:notice] = "#{@property.name} was succesfully edited"
  end

  def show
    id = params[:id]
    @property = Property.find(id)
  end

  def destroy
    @property = Property.find params[:id]
    @property.destroy
    flash[:notice] = "#{@property.name} was deleted"
  end

  def index
    @properties = Property.all
  end
  
  def update
    @property = Property.find params[:id]
    @property.update_attributes!(property_params)
    flash[:notice] ="#{@property.name} was updated"
    redirect_to propertyDetail_path(@property)
  end
  
  
end
