require 'rails_helper'
describe SessionsController, type: :controller do
    before do
     #Auth Hash
     request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github] 
    end
    
    describe "#create" do
      #create session controller
      let(:user) { instance_double('User', name: 'carla', email: 'caera17@example.edu') }
      let(:auth_id) { instance_double('Authorization', provider: 'GitHub', uid: '12346') }
      let(:auth_with) { instance_double('Authorization', provider: 'GitHub', uid: '12346', user_id: 1) }
              
      it "Authorize to log with Github" do
      allow(controller).to receive(:session?).and_return(false)
      allow(User).to receive(:exists?).with(OmniAuth.config.mock_auth[:github]['info']).and_return(false)
      expect(User).to receive(:create_with_omniauth).with(OmniAuth.config.mock_auth[:github]['info']).and_return(user)
      post :create, provider: :github
    #   expect(flash[:notice]).to  match("You have log in as @user.name")
      end
    end
    
    # describe "#failure" do
    
    # end
    
    describe "#destroy" do
        before do 
         controller.session[:user_id] = "1"
        end
        let(:id_1) {"1"}
        # let(:id_1) {"1"}
        let(:user) { instance_double('User', name: 'carla', email: 'cherna17@binghamton.edu') }
        let(:auth_id) { instance_double('Authorization', provider: 'GitHub', uid: '12346') }
        let(:auth_with) { instance_double('Authorization', provider: 'GitHub', uid: '12346', user_id: 1) }
        # let(:params){{name: "Murray street 56"}}
        it 'Delete property from system' do
              allow(User).to receive(:find).with(id_1).and_return(user)
              allow(Authorization).to receive(:find).with(id_1).and_return(user)
            #   expect().to receive(:destroy)
              delete :destroy, :id => id_1
             # expect(flash[:notice]).to  match("Murray street 56 was updated")
        end
    end
    
    # describe "#cleanup" do
    
    # end
    
    # describe "#auth_hash" do
    
    # end
    
    # describe "#same_as_logged_in_user" do
    
    # end
    
end