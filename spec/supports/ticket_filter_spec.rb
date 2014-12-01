require 'rails_helper'

RSpec.describe TicketFilter do
  let(:open_filter) {TicketFilter.new('open')}
  let(:new_ticket) {build(:ticket)}
  let(:wrong_filter) {TicketFilter.new('wrong')}
  
  before do 
    new_ticket.owner = User.first
    new_ticket.save
  end
  
  it "should return proper title" do 
    expect(open_filter.title).to eq('Open')
    expect(wrong_filter.title).to eq('Wrong')
  end
  
  it "should return proper tickets" do 
    expect(open_filter.tickets).to eq([new_ticket])
  end
  
  it "should return false with wrong type" do 
    expect(wrong_filter.tickets).to be_falsy
  end
end
