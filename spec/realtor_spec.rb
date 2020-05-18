require "rails_helper"

describe PropertyController, type: :controller do
    
    
    before(:each) do
         @current_user=instance_double('User', name: 'student')
        @property_1 = Property.create(name: "Murray street 56",apttype: "Apartment", description:"Lorem ipsum", price: 200000,address: "Lorem ipsum avenue 32, NY",status:"Leased")
    end
    
     describe "#new" do
        before(:each) do
            @property_params = {name: "name_1",apttype: "House",description: "abc123",price: 20161123}
        end
        
        it "new property" do
            @current_user=User.create
            session[:user_id] =1
      
            get :new,  property_id: @property_1[:id]
            expect(Property.find(@property_1.id)[:name]).to eq("name_1")
            expect(response).to have_http_status(200)
            expect(response).to render_template(:new)
        end
    end
    
end