require 'spec_helper'

def create_issue
  visit new_issue_path
  fill_in 'issue_title', with: 'テスト投稿'
  fill_in 'issue_content', with: ' ```Ruby \ puts("test_post") ``` '
  fill_in 'issue_author', with: 'test_user'

  click_button '投稿する'
end
