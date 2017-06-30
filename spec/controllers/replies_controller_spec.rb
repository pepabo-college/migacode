require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  describe 'POST #create' do

    before do
      @issue = create(:issue)
    end

    context '有効な属性の場合' do

      it "リクエストが302 リダイレクトになる" do
        process :create, method: :post,
          params: { issue_id: @issue.id, reply: attributes_for(:reply) }
        expect(response.status).to eq 302
      end
    end

    context '無効な属性の場合' do

      it 'リクエストは200 OKとなる' do
        process :create, method: :post,
          params: { issue_id: @issue.id, reply: attributes_for(:invalid_reply_params) }
        expect(response.status).to eq 200
      end

    end
  end
end
