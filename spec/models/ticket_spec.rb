require 'rails_helper'

RSpec.describe Ticket, :type => :model do
  let(:valid_ticket) {create(:ticket)}
  
  it "should be valid" do 
    expect(valid_ticket).to be_valid
  end
  
  it "should have proper refernece number" do
    expect(valid_ticket.ref).to match(/[A-Z]{3}-[0-9A-F]{2}-[A-Z]{3}-[0-9A-F]{2}-[A-Z]{3}/)
  end
  
  it "should have status 'Waiting for Staff Response'" do
    expect(valid_ticket.status).to eq(Status.staff_waiting.first)
  end
  
  it "should not change status automatically" do 
    valid_ticket.status = Status.cancelled.first
    valid_ticket.save
    valid_ticket.reload
    expect(valid_ticket.status).to eq(Status.cancelled.first)
  end
  
  describe "tickets scopes" do 
  
    before(:context) do 
      @first = create(:ticket)
      @second = create(:second_ticket)
    end
    
    it "should show unassigned tickets only" do 
      expect{
        @second.owner = User.first
        @second.save}.to change(Ticket.unassigned, :count).by(-1) 
    end
    
    context "with owner" do
      before(:example) do 
        @second.reload
        @second.owner = User.first
        @second.status = Status.staff_waiting.first
        @second.save
      end
      
      it "should show open tickets only" do
        expect{
          @second.status = Status.cancelled.first
          @second.save}.to change(Ticket.open, :count).by(-1) 
      end
    
      it "should show on_hold tickets only" do
        expect{ 
          @second.status = Status.on_hold.first
          @second.save}.to change(Ticket.on_hold, :count).by(1) 
      end
      
      it "should show closed tickets only" do
        expect{ 
          @second.status = Status.completed.first
          @second.save}.to change(Ticket.closed, :count).by(1) 
      end
    end
  end
end
