require 'rails_helper'
require 'features/features_helper'

feature 'ページ遷移' do

  scenario 'トップページからコードを投稿に遷移する' do
    visit issues_path
    click_link '課題を追加'

    expect(page).to have_css('h3', text: 'コードを投稿')
  end

  scenario 'コードを投稿からトップページに遷移する' do
    visit new_issue_path
    click_link '課題一覧に戻る'

    expect(page).to have_css('h2', text: '課題一覧')
  end

end

feature '登録機能' do
  scenario 'コードを投稿し、Showページにリダイレクトする' do
    create_issue
    expect(page).to have_content '課題を作成しました'
  end

  scenario '無効な値でコードを投稿し、show.html.erbテンプレートが表示される' do
    visit new_issue_path
    fill_in 'issue_title', with: nil
    fill_in 'issue_content', with: ' ```Ruby \ puts("test_post") ``` '
    fill_in 'issue_author', with: 'test_user'

    click_button '投稿する'
    expect(page).to have_content "入力に誤りがあります"
  end

end
