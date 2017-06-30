require 'rails_helper'
require 'features/features_helper'

feature 'ページ遷移' do

  scenario 'トップページから詳細ページに遷移する' do
    visit issues_path
    create_issue
    visit issues_path
    click_link 'テスト投稿'

    expect(page).to have_css('h2', text: '課題：テスト投稿')
  end

  scenario 'コードを投稿からトップページに遷移する' do
    visit issues_path
    create_issue
    visit issues_path
    click_link 'テスト投稿'
    click_button '課題一覧へ戻る'

    expect(page).to have_css('a', text: 'テスト投稿')
  end

end

feature '登録機能' do
  scenario '返信をする' do
    visit issues_path
    create_issue
    visit issues_path
    click_link 'テスト投稿'
    fill_in 'reply_author', with: "test_reply_user"
    fill_in 'reply_content', with: ' ```Ruby \ def test \ puts("test") \ end \ ```'
  end

  scenario '無効な値でコードを投稿し、show.html.erbテンプレートが表示される' do
    visit issues_path
    create_issue
    visit issues_path
    click_link 'テスト投稿'
    fill_in 'reply_author', with: nil
    fill_in 'reply_content', with: ' ```Ruby \ def test \ puts("test") \ end \ ```'

    click_button '返信する'
    expect(page).to have_content "入力に誤りがあります"
  end

end
