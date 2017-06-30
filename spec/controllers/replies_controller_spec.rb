require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  describe 'POST #create' do

    before do
      @issue = create(:issue)
    end

    context '有効な属性の場合' do

      it "showページにリダイレクト" do
        process :create, method: :post,
          params: { issue_id: @issue.id, reply: attributes_for(:reply) }
        expect(response).to redirect_to issue_path(@issue.id)
      end
    end

    context '無効な属性の場合' do

      it 'showテンプレートを再表示する' do
        process :create, method: :post,
          params: { issue_id: @issue.id, reply: attributes_for(:invalid_reply_params) }
        expect(response).to render_template "issues/show"
      end

    end
  end
end
