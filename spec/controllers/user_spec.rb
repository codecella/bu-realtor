require 'rails_helper'
describe PropertyController, type: :controller do
    
    describe "#create" do
        before do 
            controller.session[:user_id] = 1
        end
        let(:id) {1}
        let(:user){instance_double('User', name: 'pranitha')}
        let(:property_1){instance_double("Property", name: "Murray street 56",apttype: "Apartment", description:"Lorem ipsum", price: "200000")}
        let(:params){{name: "Murray street 56",apttype: "Apartment",description: "Lorem ipsum",price: "200000"}}
        it "create property" do
            allow(User).to receive(:find).with(id).and_return(user)
           
            expect(Property).to receive(:create!).with(params).and_return(property_1)
            post :create,  property: params
        end
    end
    
end
