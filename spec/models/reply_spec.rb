require 'rails_helper'

RSpec.describe Reply, type: :model do
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:author) }

  it "有効なファクトリであること" do
    expect(build(:reply)).to be_valid
  end

end
