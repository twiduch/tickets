require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe "nav_link" do
    it "generates link" do
      expect(helper.nav_link("Text", "\main?filter=open")).to eq("<a href=\"main?filter=open\">Text</a>")
    end
  end
end
