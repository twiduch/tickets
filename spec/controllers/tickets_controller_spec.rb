require 'rails_helper'

RSpec.describe TicketsController, :type => :controller do
  context "not authorized" do 
    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to redirect_to root_url
      end
    end
  
    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
    
    describe "GET show" do
      it "returns http success" do
        get :show, id: Ticket.first.ref
        expect(response).to have_http_status(:success)
      end
      
      it "redirects" do 
        get :show, id: 4
        expect(response).to redirect_to root_url
      end
    end
  
    describe "POST create" do
      context "with valid attributes" do 
        it "creates a new ticket" do 
          expect{ 
            post :create, ticket: attributes_for(:ticket) 
          }.to change(Ticket, :count).by(1) 
        end 
        
        it "redirects to the new ticket" do 
          post :create, ticket: attributes_for(:ticket) 
          expect(response).to redirect_to Ticket.last
        end
      end 
      
      context "with invalid attributes" do 
        it "does not save the new contact in the database" do 
          expect{ 
            post :create, ticket: attributes_for(:invalid_ticket) 
          }.not_to change(Ticket, :count) 
        end 
        
        it "re-renders the :new template" do 
          post :create, ticket: attributes_for(:invalid_ticket) 
          expect(response).to render_template :new
        end
      end
    end
  end
  
  context "authorized" do 
    before do
      allow(controller).to receive(:logged_in?) { true }
      allow(controller).to receive(:for_staff_only) { true }
    end
    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
