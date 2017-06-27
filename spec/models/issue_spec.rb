require 'rails_helper'

describe Issue do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:author) }

  context 'Notification flag is true' do
    before { allow(subject).to receive(:notificate_to_author?).and_return(true) }
    it { should validate_presence_of(:mail_address) }
  end

  context 'Notification flag is false' do
    before { allow(subject).to receive(:notificate_to_author?).and_return(false) }
    it { should_not validate_presence_of(:mail_address) }
  end
end
