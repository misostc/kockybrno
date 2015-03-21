require "rails_helper"

RSpec.describe InzeratMailer, type: :mailer do
  describe "cat_added" do
    let(:mail) { InzeratMailer.cat_added }

    it "renders the headers" do
      expect(mail.subject).to eq("Cat added")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
