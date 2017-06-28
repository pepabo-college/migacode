require 'rails_helper'

RSpec.describe IssuesController, type: :controller do

  describe 'GET #index' do

    it 'リクエストが200 OKとなること'  do
      expect(response.status).to eq 200
    end

    it "indexテンプレートが表示されること" do
      get :index
      expect(response).to render_template :index
    end
  end


  describe 'GET #new' do

    it 'リクエストが200 OKとなること' do
      get :new
      expect(response.status).to eq 200
    end

    it "newテンプレートが表示されること" do
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'GET #edit' do
    let(:issue) { create(:issue) }

    it 'リクエストが200 OKとなること' do
      get :edit, params: {id: issue.id}
      expect(response.status).to eq 200
    end

    it "editテンプレートが表示されること" do
      get :edit, params: {id: issue.id}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    let(:issue) { create(:issue) }

    it 'リクエストは200 OKとなること'  do
      get :show, params: {id: issue.id}
      expect(response.status).to eq 200
    end

    it "show.html.erbテンプレートが表示されること" do
      get :show, params: {id: issue.id}
      expect(response).to render_template :show
    end
  end


  describe 'DELETE #destroy' do
    before :each do
      @issue = create(:issue)
    end

    it '課題を削除する' do
      expect{
        process :destroy, method: :delete, params: { id: @issue.id }
      }.to change(Issue, :count).by(-1)
    end

    it 'リクエスト302 リダイレクトになること' do
      process :destroy, method: :delete, params: { id: @issue.id }
      expect(response.status).to eq 302
    end

    it 'indexページにリダイレクト' do
      process :destroy, method: :delete, params: { id: @issue.id }
      expect(response).to redirect_to issues_path
    end
  end


end
