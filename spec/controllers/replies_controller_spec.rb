require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  describe 'POST #create' do

    before do
      @issue = create(:issue)
    end

    context '有効な属性の場合' do
      it 'データベースに新しいユーザーを保存' do
        expect{
          process :create, method: :post,
            params: { issue_id: @issue.id, reply: attributes_for(:reply) }
        }.to change(Reply, :count).by(1)
      end

      it "showページにリダイレクト" do
        process :create, method: :post,
          params: { issue_id: @issue.id, reply: attributes_for(:reply) }
        expect(response).to redirect_to issue_path(@issue.id)
      end
    end

    context '無効な属性の場合' do

      it 'データベースに新しいユーザーを保存しない' do
        expect{
          process :create, method: :post,
          params: { issue_id: @issue.id, reply: attributes_for(:invalid_reply_params) }
        }.not_to change(Reply, :count)
      end

      it 'showテンプレートを再表示する' do
        process :create, method: :post,
          params: { issue_id: @issue.id, reply: attributes_for(:invalid_reply_params) }
        expect(response).to render_template "issues/show"
      end
    end
  end
end
