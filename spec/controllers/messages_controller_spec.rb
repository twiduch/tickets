require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do
  describe "POST create" do
    context "with valid attributes" do 
      let!(:new_ticket) {create(:ticket)}
      
      it "creates a new message" do 
        expect{ 
          post :create, message: attributes_for(:message).merge({ticket_id: new_ticket.id})
        }.to change(Message, :count).by(1) 
      end 
    end 
  end
end
