require "rails_helper"

describe WelcomeController, type: :controller do
    
    
    before(:each) do
        @current_user=instance_double('User', name: 'student')
        @property_1 = Property.create(name: "Murray street 56",apttype: "Apartment", description:"Lorem ipsum", price: 200000,address: "Lorem ipsum avenue 32, NY",status:"Leased")
    end
    
end
