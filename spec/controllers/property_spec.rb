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
    
    describe '#show' do
        before do 
            controller.session[:user_id] = "1"
        end
        let(:id) {"1"}
        # let(:id_1) {"1"}
        let(:user){instance_double('User', name: 'pranitha')}
        let(:property_1){instance_double("Property", name: "Murray street 56")}
        let(:params){{name: "Murray street 56"}}
        it 'show the property' do
            allow(User).to receive(:find).with(id).and_return(user)
            expect(Property).to receive(:find).with(id).and_return(property_1)
            get :show, :id => id  
        end
    end
    
    describe '#edit' do
        before do 
            controller.session[:user_id] = "1"
        end
        let(:id_1) {"1"}
        # let(:id_1) {"1"}
        let(:user){instance_double('User', name: 'pranitha')}
        let(:property_1){instance_double("Property", name: "Murray street 56")}
        let(:params){{name: "Murray street 56"}}
        it 'edit the property' do
            allow(User).to receive(:find).with(id_1).and_return(user)
            expect(Property).to receive(:find).with(id_1).and_return(property_1)
            get :edit, :id => id_1
        end
        it 'Send an update that the property was edited' do
            allow(User).to receive(:find).with(id_1).and_return(user)
            allow(Property).to receive(:find).with(id_1).and_return(property_1)
            get :edit, :id => id_1
            #expect(flash[:notice]).to  match(/Murray street 56 was succesfully edited/)
        end
    end
  
   describe '#destroy' do
        before do 
         controller.session[:user_id] = "1"
        end
        let(:id_1) {"1"}
        # let(:id_1) {"1"}
        let(:user){instance_double('User', name: 'pranitha')}
        let(:property_1){instance_double("Property", name: "Murray street 56")}
        # let(:updated_property){instance_double("Property", name: "Murray street 58")}
        let(:params){{name: "Murray street 56"}}
        it 'Delete property from system' do
            allow(User).to receive(:find).with(id_1).and_return(user)
            allow(Property).to receive(:find).with(id_1).and_return(property_1)
            expect(property_1).to receive(:destroy)
            delete :destroy, :id => id_1
        end
  end
  
   describe '#update' do
        before do 
         controller.session[:user_id] = "1"
        end
        let(:id_1) {"1"}
        # let(:id_1) {"1"}
        let(:user){instance_double('User', name: 'pranitha')}
        let(:property){instance_double("Property", name: "Murray street 56")}
        # let(:updated_property){instance_double("Property", name: "Murray street 58")}
        let(:params){{name: "Murray street 56"}}
        it 'Get data from the property' do
            allow(User).to receive(:find).with(id_1).and_return(user)
            expect(Property).to receive(:find).with(id_1).and_return(property)
            allow(property).to receive(:update_attributes!).with(params)
            put :update, :id => id_1, property: params

        end
        it "update a param of the property" do
            allow(User).to receive(:find).with(id_1).and_return(user)
            allow(Property).to receive(:find).with(id_1).and_return(property)
            expect(property).to receive(:update_attributes!).with(params)
            put :update, :id => id_1, property: params
        end
         it "Send an update that the record has been updated" do
            allow(User).to receive(:find).with(id_1).and_return(user)
            allow(Property).to receive(:find).with(id_1).and_return(property)
            allow(property).to receive(:update_attributes!).with(params)
            put :update, :id => id_1, property: params
            expect(flash[:notice]).to  match("Murray street 56 was updated")
            #  redirect_to propertyDetail_path(@property)
        end
    end
end