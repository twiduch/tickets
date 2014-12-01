require 'rails_helper'

RSpec.describe UniqueReference, :type => :model do
  let(:ref) {UniqueReference.new}
  let(:id) {UniqueReference.generate}
  
  it "should generate proper id" do
    expect(ref.generate).to match(/[A-Z]{3}-[0-9A-F]{2}-[A-Z]{3}-[0-9A-F]{2}-[A-Z]{3}/)
    expect(id).to match(/[A-Z]{3}-[0-9A-F]{2}-[A-Z]{3}-[0-9A-F]{2}-[A-Z]{3}/)
  end
end
