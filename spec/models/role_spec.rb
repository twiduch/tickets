require 'rails_helper'

RSpec.describe Role, :type => :model do
  let(:admin) {Role.where(name: 'admin')}
  let(:staff) {Role.where(name: 'staff')}
  let(:new_role) {create(:role)}
  
  it "should get admin role" do 
    expect(Role.admin).to eq(admin)
  end
 
  it "should get staff role" do 
    expect(Role.staff).to eq(staff)
  end 
  
  it "should not create role with no name" do
    role_no_name = build(:role, name: '')
    expect(role_no_name).not_to be_valid
    expect{role_no_name.save}.not_to change(Role, :count) 
  end
  
  it "should be able to create new role" do 
    expect(new_role).to be_valid
  end
  
  it "should not add same role" do
    same_role_name = build(:role, name: new_role.name)
    expect{same_role_name.save}.not_to change(Role, :count) 
  end
  
  it "should not destroy roles" do 
    new_role
    expect{new_role.destroy}.not_to change(Role, :count) 
  end
end
