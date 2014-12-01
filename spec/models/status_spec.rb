require 'rails_helper'

RSpec.describe Status, :type => :model do
  
  let(:new_status) {create(:status)}
    
  it "should not create status with no name" do
    status_no_name = build(:status, name: '')
    expect(status_no_name).not_to be_valid
    expect{status_no_name.save}.not_to change(Status, :count) 
  end
  
  it "should be able to create new status" do 
    expect(new_status).to be_valid
  end
  
  it "should not add same status" do
    same_status_name = build(:status, name: new_status.name)
    expect{same_status_name.save}.not_to change(Status, :count) 
  end
  
  it "should not destroy statuses" do 
    new_status
    expect{new_status.destroy}.not_to change(Status, :count) 
  end
end
