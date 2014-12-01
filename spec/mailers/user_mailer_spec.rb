require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "new_ticket" do
    let(:mail) { UserMailer.new_ticket('john@abc.com', 'abc-54', 'http://abc.com') }

    it "renders the headers" do
      expect(mail.subject).to eq('New support ticket')
      expect(mail.to).to eq(['john@abc.com'])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(/abc-54/)
    end
  end

end
