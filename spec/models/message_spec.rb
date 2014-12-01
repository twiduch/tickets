require 'rails_helper'

RSpec.describe Message, :type => :model do
  let(:my_ticket) {create(:ticket)}
  let(:my_message) {build(:message)}
  
  it "should not be valid without ticket connection" do 
    expect(my_message).not_to be_valid
  end
  
  it "should be valid" do 
    my_message.ticket = my_ticket
    my_message.prev_status = my_ticket.status
    expect(my_message).to be_valid
  end
  
  
end
