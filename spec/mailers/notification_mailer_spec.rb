require "rails_helper"

RSpec.describe NotificationMailer, type: :mailer do
  describe "notificate_to_author" do
    before do
      @issue = create(:issue)
      @email = NotificationMailer.notificate_to_author(@issue)
      @email.deliver_now
    end

    after { ActionMailer::Base.deliveries.clear }

    it "should send an email." do
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it "should send a notification mail to the author's mail address." do
      expect(@email).to deliver_to(@issue.mail_address)
    end

    it "should send an email from the correct mail address." do
      expect(@email).to deliver_from("notification@migacode.herokuapp.com")
    end

    it "should contain the author's name" do
      expect(@email).to have_body_text(/#{@issue.author} 様/)
    end

    it "should contain the correct issue url." do
      expect(@email).to have_body_text(/issues\/#{@issue.id}/)
    end
  end
end
