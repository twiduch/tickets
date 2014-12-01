require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:non_valid_user1) {build(:user, username: '')}
  let(:non_valid_user2) {build(:user, first_name: '')}
  let(:valid_user) {build(:user)}
  
  it "should check presence" do 
    expect(non_valid_user1).not_to be_valid
    expect(non_valid_user2).not_to be_valid
  end
  
  it "should be valid" do 
    expect(valid_user).to be_valid
  end
  
  it "should add default role" do
    expect(valid_user.roles).to eq(Role.staff)
  end
  
  it "should check unique username" do 
    create(:user, username: valid_user.username.upcase)
    expect(valid_user).not_to be_valid
  end
  
  it "should check password length" do 
    valid_user.password = 'a' * 5
    expect(valid_user).not_to be_valid
  end
  
end
