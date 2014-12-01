require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "POST create" do
    let!(:new_user) {create(:user)}
    
    it "creates a new session" do 
      post :create, session: attributes_for(:user) 
      expect(response).to redirect_to tickets_path
    end 
    
    it "redirects to root" do 
      post :create, session: attributes_for(:user2) 
      expect(response).to redirect_to root_url
    end 
  end

end
