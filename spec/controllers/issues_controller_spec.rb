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

end
